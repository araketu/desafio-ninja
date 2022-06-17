FactoryBot.define do
    factory :meeting do
      title { 'Reunião - Novas Sprints' }
      starts_at { '2022-06-17 13:00:00' }
      ends_at { '2022-06-17 14:00:00' }
      room { create(:room) }
  
      trait :invalid_meeting do
        title { 'Reunião Inválida' }
        starts_at { '2022-06-17 14:00:00' }
        ends_at { '2022-60-17 13:00:00' }
      end
    end
  end