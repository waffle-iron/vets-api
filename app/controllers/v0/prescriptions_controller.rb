# frozen_string_literal: true
module V0
  class PrescriptionsController < RxController
    SORT_FIELDS   = %w(prescription_name refill_status ordered_date facility_name).freeze
    SORT_TYPES    = (SORT_FIELDS + SORT_FIELDS.map { |field| "-#{field}" }).freeze
    DEFAULT_SORT  = '-ordered_date'

    # This index action supports various parameters described below, all are optional
    # This comment can be removed once documentation is finalized
    # @param refill_status - one refill status to filter on
    # @param page - the paginated page to fetch
    # @param per_page - the number of items to fetch per page
    # @param sort - the attribute to sort on, negated for descending
    #        (ie: ?sort=facility_name,-prescription_id)
    def index
      resource = collection_resource
      resource = resource.sort(params[:sort] || DEFAULT_SORT, allowed: SORT_TYPES)
      resource = resource.paginate(pagination_params)
      render json: resource.data,
             serializer: CollectionSerializer,
             each_serializer: PrescriptionSerializer,
             meta: resource.metadata
    end

    def show
      id = params[:id].try(:to_i)
      resource = client.get_rx(id)
      raise VA::API::Common::Exceptions::RecordNotFound, id unless resource.present?
      render json: resource,
             serializer: PrescriptionSerializer,
             meta: resource.metadata
    end

    def refill
      client.post_refill_rx(params[:id])
      head :no_content
    end

    private

    def collection_resource
      case params[:refill_status]
      when nil
        client.get_history_rxs
      when 'active'
        client.get_active_rxs
      else
        client.get_history_rxs.find_by(:refill_status, params[:refill_status])
      end
    end
  end
end
