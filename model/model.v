/*
 * Copyright 2022 XXIV
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module model

pub struct Meal {
pub:
	id_meal                        string [json: idMeal]
	str_meal                       string [json: strMeal]
	str_drink_alternate            string [json: strDrinkAlternate]
	str_category                   string [json: strCategory]
	str_area                       string [json: strArea]
	str_instructions               string [json: strInstructions]
	str_meal_thumb                 string [json: strMealThumb]
	str_tags                       string [json: strTags]
	str_youtube                    string [json: strYoutube]
	str_ingredient1                string [json: strIngredient1]
	str_ingredient2                string [json: strIngredient2]
	str_ingredient3                string [json: strIngredient3]
	str_ingredient4                string [json: strIngredient4]
	str_ingredient5                string [json: strIngredient5]
	str_ingredient6                string [json: strIngredient6]
	str_ingredient7                string [json: strIngredient7]
	str_ingredient8                string [json: strIngredient8]
	str_ingredient9                string [json: strIngredient9]
	str_ingredient10               string [json: strIngredient10]
	str_ingredient11               string [json: strIngredient11]
	str_ingredient12               string [json: strIngredient12]
	str_ingredient13               string [json: strIngredient13]
	str_ingredient14               string [json: strIngredient14]
	str_ingredient15               string [json: strIngredient15]
	str_ingredient16               string [json: strIngredient16]
	str_ingredient17               string [json: strIngredient17]
	str_ingredient18               string [json: strIngredient18]
	str_ingredient19               string [json: strIngredient19]
	str_ingredient20               string [json: strIngredient20]
	str_measure1                   string [json: strMeasure1]
	str_measure2                   string [json: strMeasure2]
	str_measure3                   string [json: strMeasure3]
	str_measure4                   string [json: strMeasure4]
	str_measure5                   string [json: strMeasure5]
	str_measure6                   string [json: strMeasure6]
	str_measure7                   string [json: strMeasure7]
	str_measure8                   string [json: strMeasure8]
	str_measure9                   string [json: strMeasure9]
	str_measure10                  string [json: strMeasure10]
	str_measure11                  string [json: strMeasure11]
	str_measure12                  string [json: strMeasure12]
	str_measure13                  string [json: strMeasure13]
	str_measure14                  string [json: strMeasure14]
	str_measure15                  string [json: strMeasure15]
	str_measure16                  string [json: strMeasure16]
	str_measure17                  string [json: strMeasure17]
	str_measure18                  string [json: strMeasure18]
	str_measure19                  string [json: strMeasure19]
	str_measure20                  string [json: strMeasure20]
	str_source                     string [json: strSource]
	str_imagesource                string [json: strImageSource]
	str_creative_commons_confirmed string [json: strCreativeCommonsConfirmed]
	date_modified                  string [json: dateModified]
}

pub struct Category {
pub:
	id_category              string [json: idCategory]
	str_category             string [json: strCategory]
	str_category_thumb       string [json: strCategoryThumb]
	str_category_description string [json: strCategoryDescription]
}

pub struct Ingredient {
pub:
	id_ingredient   string [json: idIngredient]
	str_ingredient  string [json: strIngredient]
	str_description string [json: strDescription]
	str_type        string [json: strType]
}

pub struct Filter {
pub:
	str_meal       string [json: strMeal]
	str_meal_thumb string [json: strMealThumb]
	id_meal        string [json: idMeal]
}