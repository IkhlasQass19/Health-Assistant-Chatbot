from flask import Flask, render_template, request, jsonify
from pyswip import Prolog
from flask import Flask, render_template, request, jsonify
from flask_cors import CORS  # Import the CORS module

import json


app = Flask(__name__)
CORS(app)  # Enable CORS for all routes
prolog = Prolog()

# Charger les règles depuis votre fichier symptom.pl
prolog.consult("symptom.pl")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/diagnose', methods=['GET'])
def diagnose():
    symptoms = request.args.get('symptoms')
    symptoms_list = [symptom.strip() for symptom in symptoms.split(',')]
    
    # Format the symptoms list as a Prolog list string
    prolog_list = "[" + ", ".join([f'"{s}"' for s in symptoms_list]) + "]"


    print(prolog_list)


    try:
        # Appeler la logique Prolog pour le diagnostic
        result = list(prolog.query(f"diagnose({prolog_list}, Disease), recommandations(Disease, Recommendations)."))
        if result:
            diagnosis = result[0]['Disease'].decode('utf-8')  # Decode bytes to string
            print(diagnosis)
            #print(result)
            recommendations=result[0]['Recommendations'].decode('utf-8')
            print(recommendations)
        else:
            diagnosis = "not_understand"
            recommendations="No recommendations available."

        # Appeler la logique Prolog pour obtenir les recommandations
        #recommendations = get_recommendations(diagnosis)

        return jsonify({'diagnosis': diagnosis, 'Recommendations': recommendations})

    except Exception as e:
        return jsonify({'error': str(e)}), 500



    except Exception as e:
        return str(e)

if __name__ == '__main__':
    app.run(port=5000, debug=True)
