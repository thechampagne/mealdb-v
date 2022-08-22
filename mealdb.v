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
module mealdb

import net.http
import net.urllib
import model {Meal, Category, Filter, Ingredient}
import json

struct MealResponse {
    meals []Meal
}

struct IngredientResponse {
    meals []Ingredient
}

struct CategoryResponse {
	categories []Category
}

struct FilterResponse {
    meals []Filter
}

struct CategoriesFilter {
	meals []struct {
		str_category string [json: strCategory]
	}
}

struct AreaFilter {
	meals []struct {
		str_area string [json: strArea]
	}
}

fn get_request(endpoint string) ?string {
	response := http.get('https://themealdb.com/api/json/v1/1/$endpoint') or { return err }
	return response.body
}

// search meal by name
pub fn search(s string) ?[]Meal {
	response := get_request('search.php?s=${urllib.query_escape(s)}') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(MealResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals
}

// search meals by first letter
pub fn search_by_letter(c string) ?[]Meal {
	response := get_request('search.php?f=$c') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(MealResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals
}

// search meal details by id
pub fn search_by_id(i i64) ?Meal {
	response := get_request('lookup.php?i=$i') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(MealResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals[0]
}

// random meal
pub fn random() ?Meal {
	response := get_request('random.php') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(MealResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals[0]
}

// List the meals categories
pub fn meal_categories() ?[]Category {
	response := get_request('categories.php') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CategoryResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.categories.len == 0 {
        return error('no results found')
	}

	return json.categories
}

// filter by ingredient
pub fn filter_by_ingredient(s string) ?[]Filter {
	response := get_request('filter.php?i=$s') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals
}

// filter by area
pub fn filter_by_area(s string) ?[]Filter {
	response := get_request('filter.php?a=$s') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals
}

// filter by category
pub fn filter_by_category(s string) ?[]Filter {
	response := get_request('filter.php?c=$s') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(FilterResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}

	if json.meals.len == 0 {
        return error('no results found')
	}

	return json.meals
}

// List the categories filter
pub fn categories_filter() ?[]string {
	response := get_request('list.php?c=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(CategoriesFilter, response) or {
        return error('Something went wrong while reading json: $err')
	}
	if json.meals.len == 0 {
        return error('no results found')
	}
	mut array := []string{}
	for i in json.meals {
		array << i.str_category
	}
	return array
}

// List the ingredients filter
pub fn ingredients_filter() ?[]Ingredient {
	response := get_request('list.php?i=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(IngredientResponse, response) or {
        return error('Something went wrong while reading json: $err')
	}
	if json.meals.len == 0 {
        return error('no results found')
	}
	return json.meals
}

// List the area filter
pub fn area_filter() ?[]string {
	response := get_request('list.php?a=list') or { return error(err.str()) }
	if response.len == 0 {
		return error('no results found')
	}
	json := json.decode(AreaFilter, response) or {
        return error('Something went wrong while reading json: $err')
	}
	if json.meals.len == 0 {
        return error('no results found')
	}
	mut array := []string{}
	for i in json.meals {
		array << i.str_area
	}
	return array
}