# frozen_string_literal: true
FactoryGirl.define do
  factory :education_benefit_claim, class: EducationBenefitsClaim do
    form do
      {
        chapter1606: true,
        fullName: {
          first: 'Mark',
          last: 'Olson'
        },
        gender: 'M',
        birthday: '03/07/1985',
        socialSecurityNumber: '111223333',
        address: {
          country: 'USA',
          state: 'WI',
          zipcode: '53130',
          street: '123 Main St',
          city: 'Milwaukee'
        },
        phone: '5551110000',
        emergencyContact: {
          fullName: {
            first: 'Sibling',
            last: 'Olson'
          },
          sameAddressAndPhone: true
        },
        bankAccount: {
          accountType: 'checking',
          bankName: 'First Bank of JSON',
          routingNumber: '123456789',
          accountNumber: '88888888888'
        },
        previouslyFiledClaimWithVa: false,
        previouslyAppliedWithSomeoneElsesService: false,
        alreadyReceivedInformationPamphlet: true,
        schoolName: 'FakeData University',
        schoolAddress: {
          country: 'USA',
          state: 'MD',
          zipcode: '21231',
          street: '111 Uni Drive',
          city: 'Baltimore'
        },
        educationStartDate: '08/29/2016',
        educationalObjective: '...',
        courseOfStudy: 'History',
        educationType: {
          college: true,
          testReimbursement: true
        },
        currentlyActiveDuty: false,
        terminalLeaveBeforeDischarge: false,
        highSchoolOrGedCompletionDate: '06/06/2010',
        nonVaAssistance: false,
        guardsmenReservistsAssistance: false,

        additionalContributions: false,
        activeDutyKicker: false,
        reserveKicker: false,
        serviceBefore1977: false,
        # rubocop:disable LineLength
        remarks: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sit amet ullamcorper est, in interdum velit. Cras purus orci, varius eget efficitur nec, dapibus id risus. Donec in pellentesque enim. Proin sagittis, elit nec consequat malesuada, nibh justo luctus enim, ac aliquet lorem orci vel neque. Ut eget accumsan ipsum. Cras sed venenatis massa. Duis odio urna, laoreet quis ante sed, facilisis congue purus. Etiam semper facilisis luctus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam blandit eget nibh at ornare. Sed non porttitor dui. Proin ornare magna diam, ut lacinia magna accumsan euismod.

        Phasellus et nisl id lorem feugiat molestie. Aliquam molestie,
        nulla eu fringilla finibus, massa lectus varius quam, quis ornare
        sem lorem lacinia dui. Integer consequat non arcu convallis mollis.
        Vivamus magna turpis, pharetra non eros at, feugiat rutrum nisl.
        Maecenas eros tellus, blandit id libero sed, imperdiet fringilla
        eros. Nulla vel tortor vel neque fermentum laoreet id vitae ex.
        Mauris posuere lorem tellus. Pellentesque at augue arcu.
        Vestibulum aliquam urna ac est lacinia, eu congue nisi tempor.
        ",
        # rubocop:enable LineLength
        toursOfDuty: [
          {
            dateRange: {
              from: '01/01/2001',
              to: '10/10/2010'
            },
            serviceBranch: 'Army',
            serviceStatus: 'Active Duty',
            involuntarilyCalledToDuty: false
          },
          {
            dateRange: {
              from: '01/01/1995',
              to: '10/10/1998'
            },
            serviceBranch: 'Army',
            serviceStatus: 'Honorable Discharge',
            involuntarilyCalledToDuty: true
          }
        ]
      }
    end
  end
end
