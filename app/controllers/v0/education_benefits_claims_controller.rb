# frozen_string_literal: true
module V0
  class EducationBenefitsClaimsController < ApplicationController
    skip_before_action(:authenticate)

    def create
      education_benefits_claim = EducationBenefitsClaim.new(education_benefits_claim_params)

      raise VA::API::Common::Exceptions::ValidationErrors, education_benefits_claim unless education_benefits_claim.save

      render(json: education_benefits_claim)
    end

    private

    def education_benefits_claim_params
      params.require(:education_benefits_claim).permit(:form)
    end
  end
end
