FactoryGirl.define do
  factory :education_benefit_form, class: OpenStruct do
    fullName { 
      first { "Mark"}
      last { "Olson"}
    }
    initialize_with { OpenStruct.new }
  end
end