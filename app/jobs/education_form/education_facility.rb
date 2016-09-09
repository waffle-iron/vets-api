module EducationForm
  class EducationFacility
    # sourced from http://www.vba.va.gov/pubs/forms/VBA-22-1990-ARE.pdf

    @default = :eastern
    EASTERN = [
      'CT', 'DE', 'DC', 'ME', 'MD', 'MA', 'NH', 'NJ', 'NY', 'PA', 
      'RI', 'VT', 'VA'
    ]

    SOUTHERN = [
      'GA' 'NC', 'PR', 'US Virgin Islands', 'APO/FPO AA'
    ]

    CENTRAL = [ 
      'CO', 'IA', 'IL', 'IN', 'KS', 'KY', 'MI', 'MN', 'MO', 'MT', 
      'NE', 'ND', 'OH', 'SD', 'TN', 'WV', 'WI', 'WY'
    ]

    WESTERN = [
      'AK',' AL', 'AR', 'AZ', 'CA', 'FL', 'HI', 'ID', 'LA', 'MS', 
      'NM', 'NV', 'OK', 'OR', 'SC', 'TX', 'UT', 'WA', 'Philippines',
      'Guam', 'APO/FPO AP'
    ]

    def self.region_for(record)
      area = record.schoolAddress&.state || record.address&.state
      case area
      when *EASTERN
        :eastern
      when *SOUTHERN
        :southern
      when *CENTRAL
        :central
      when *WESTERN
        :western
      else
        @default
      end
    end
  end
end