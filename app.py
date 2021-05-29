import pandas as pd

# Importing db of food items across all canteens registered on the platform
df1=pd.read_csv('D:/ML/Food-Recommendation-System-Pyhton/db/food.csv')
print(df1)

def create_soup(x):
    tags = x['title'].lower().split()
    tags.extend(x['category'].lower().split())
    return " ".join(sorted(set(tags), key=tags.index))

df1['soup'] = df1.apply(create_soup, axis=1)
df1.head(3)

# Import CountVectorizer and create the count matrix
from sklearn.feature_extraction.text import CountVectorizer

count = CountVectorizer(stop_words='english')

# df1['soup']
count_matrix = count.fit_transform(df1['soup'])

# Compute the Cosine Similarity matrix based on the count_matrix
from sklearn.metrics.pairwise import cosine_similarity

cosine_sim = cosine_similarity(count_matrix, count_matrix)

indices_from_title = pd.Series(df1.index, index=df1['name'])
#indices_from_food_id = pd.Series(df1.index, index=df1['id'])


# Function that takes in food title or food id as input and outputs most similar dishes
def get_recommendations(title="", cosine_sim=cosine_sim, idx=-1):
    # Get the index of the item that matches the title
    if idx == -1 and title != "":
        idx = indices_from_title[title]

    # Get the pairwsie similarity scores of all dishes with that dish
    sim_scores = list(enumerate(cosine_sim[idx]))

    # Sort the dishes based on the similarity scores
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)

    # Get the scores of the 8 most similar dishes
    sim_scores = sim_scores[1:9]

    # Get the food indices
    food_indices = [i[0] for i in sim_scores]

    # Return the top 10 most similar dishes
    return food_indices
# get API from code

from flask import Flask, jsonify, request
from waitress import serve

app = Flask(__name__)

@app.route('/')
def abdo():
        title = request.args['tags']
        recommendation = df1.loc[get_recommendations(title=title)]
        recommendation_dict = recommendation.to_dict(orient='records')
        return jsonify({"data": recommendation_dict})


if __name__ == '_main_':
    # app.run()
    serve(app, host='0.0.0.0', port=8000)











