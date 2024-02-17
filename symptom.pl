% Faits pour les différents symptômes et conditions
symptomes("common cold", ["cold", "cough", "tiredness", "body pain"]).
symptomes("common cold", ["cold", "cough", "tiredness"]).

symptomes("fever", ["fever"]).

symptomes("allergies", ["sneezing", "itchy eyes", "runny nose", "skin rash"]).
symptomes("allergies", ["sneezing", "itchy eyes", "runny nose"]).
symptomes("allergies", ["sneezing", "skin rash", "runny nose"]).
symptomes("allergies", ["runny nose", "skin rash"]).

symptomes("asthma", ["shortness of breath", "wheezing", "cough", "chest tightness"]).
symptomes("asthma", ["shortness of breath", "wheezing", "cough"]).
symptomes("asthma", ["wheezing", "cough"]).
symptomes("asthma", ["wheezing", "cough", "chest tightness"]).
symptomes("asthma", ["shortness of breath", "chest tightness"]).

symptomes("bronchial asthma", ["cough", "fatigue", "high fever", "family history", "mucoid sputum", "breathlessness"]).
symptomes("bronchial asthma", ["cough", "high fever", "family history", "mucoid sputum"]).
symptomes("bronchial asthma", ["cough", "high fever", "breathlessness"]).
symptomes("bronchial asthma", ["cough", "breathlessness"]).
symptomes("bronchial asthma", ["cough", "fatigue", "family history"]).

symptomes("rheumatoid arthritis", ["joint pain", "joint stiffness", "swelling", "fatigue"]).
symptomes("rheumatoid arthritis", ["joint pain", "joint stiffness", "swelling"]).
symptomes("rheumatoid arthritis", ["joint pain", "joint stiffness", "fatigue"]).
symptomes("rheumatoid arthritis", ["joint stiffness", "swelling", "fatigue"]).
symptomes("rheumatoid arthritis", ["joint pain", "swelling", "fatigue"]).
symptomes("rheumatoid arthritis", ["joint stiffness", "swelling"]).

symptomes("arthritis", ["painful walking", "movement stiffness", "muscle weakness", "stiff neck", "swelling joints"]).
symptomes("arthritis", ["painful walking", "movement stiffness", "muscle weakness"]).
symptomes("arthritis", ["painful walking", "stiff neck", "swelling joints"]).
symptomes("arthritis", ["painful walking", "movement stiffness", "swelling joints"]).
symptomes("arthritis", ["muscle weakness", "stiff neck", "swelling joints"]).

% Règles pour les précautions et les recommandations
recommandations("common cold", "To avoid common cold:\n1. Wash your hands frequently.\n2. Avoid close contact with infected individuals.\n3. Cover your mouth and nose when sneezing or coughing.\n4. Boost your immune system through a healthy diet and regular exercise.").

recommandations("fever", "To avoid fever:\n1. Stay hydrated.\n2. Rest and get plenty of sleep.\n3. Use fever-reducing medications as directed.\n4. Seek medical attention if fever persists or worsens.").

recommandations("allergies", "To avoid allergies:\n1. Identify and avoid allergens.\n2. Keep indoor environments clean and dust-free.\n3. Take allergy medications as prescribed.\n4. Consider allergy shots for long-term relief.").

recommandations("asthma", "To avoid asthma:\n1. Identify and avoid asthma triggers.\n2. Use prescribed inhalers and medications regularly.\n3. Create an asthma action plan with your healthcare provider.\n4. Maintain a clean and allergen-free home environment.").

recommandations("bronchial asthma", "To avoid bronchial asthma:\n1. Follow your asthma action plan.\n2. Avoid smoke and pollutants.\n3. Use a humidifier to keep air moist.\n4. Exercise regularly as recommended by your doctor.").

recommandations("rheumatoid arthritis", "To avoid rheumatoid arthritis:\n1. Maintain a healthy weight.\n2. Exercise to strengthen joints and muscles.\n3. Take prescribed medications as directed.\n4. Consider physical therapy and joint protection techniques.").

recommandations("arthritis", "To avoid arthritis:\n1. Maintain a healthy weight.\n2. Exercise regularly for joint health.\n3. Use joint protection techniques.\n4. Consider physical therapy and assistive devices if needed.").

diagnose(Symptoms, Disease) :-
    symptomes(Disease, SymptomsList),
    check_symptoms(SymptomsList, Symptoms),
    !.  % Pour empêcher la recherche de correspondance supplémentaire après avoir trouvé une correspondance
diagnose(_, "not_understand").  % Correspondance par défaut si aucun symptôme ne correspond

check_symptoms([], _).
check_symptoms([Symptom | Rest], Symptoms) :-
    member(Symptom, Symptoms),
    check_symptoms(Rest, Symptoms).