# Catapult API 

## Set up

```
rake db:setup
rails s
```

Using your favorite rest client (I use Postman), set it up with the following headers:
```
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
```
For making POSTs & PATCHes, set the body type to raw -> JSON (application/json)

## The basics

My API has three models: Breed, Tag, and Assignment.

Breed and Tag are straightforward. Assignment is a double polymorphic that acts as the passthrough between the other two. I did this to make it as useful as possible for potential future use of assigning one record to another.

I wrote this API to follow the JSON API specification, being the standard. As such, all requests expect that format.


## Making requests

#### Breeds

`GET /breeds`
http://localhost:3000/api/v1/breeds

`GET /breeds/:id, DELETE /breeds/:id`
http://localhost:3000/api/v1/breeds/:id

`GET /breeds/:id (show tag relationships)`
http://localhost:3000/api/v1/breeds/1?include=tags

`POST /breeds`
http://localhost:3000/api/v1/breeds

Example body in JSON API format:
```
{
  "data": {
    "type": "breeds",
    "attributes": {
      "name": “Tabby”
    }
  }
}
```

`PATCH /breeds/:id`
http://localhost:3000/api/v1/breeds/:id

```
{
  "data": {
    "type": "breeds",
    "id": 12,
    "attributes": {
      "name": "Nyan",
      "tags_ids": [1,3]
    }
  }
}
```

#### Tags
Similar to breeds. Tags are created with a label attribute instead of a name, though:

`POST /tags`
http://localhost:3000/api/v1/tags

Example body in JSON API format:
```
{
  "data": {
    "type": "tags",
    "attributes": {
      "label": “Sheds a lot”
    }
  }
}
```

#### Stats

`GET /tags/stats`
http://localhost:3000/api/v1/tags/stats

`GET /breeds/stats`
http://localhost:3000/api/v1/breeds/stats


## All about the stats controller

One of the requirements of this project was to create index routes for /breeds/stats and /tags/stats. For this I made a special stats controller that has the intention of being used to render the resources of any model.

The stats controller index figures out the associations on the resource model in question via the .reflections method:
```
has_manys = @resource_model.reflections.keys.reject{|k| k == "assignments"}
# For Breed it will be ["tags"], for Tag it will be ["breeds"]
# More associations could be added, and they would automatically work the same way

```
It then uses the resource’s own serializer to render the index, passing along instance options that signify that it should render the stats (you can see how it works in `active_model_serializers.rb`).


## Unit tests

I wrote model, controller, routing, and serializer tests with Rspec. I used Factory Girl and the Faker gem for generating seed data.

To run all tests and verify that all of them passed:
`rspec -fd`


## What I would improve

**Simultaneously creating breed + tags:** I debated whether or not to include the ability to POST a breed while simultaneously allowing you to find existing or create new tags from passed-in label strings in the attributes. There have been (long discussions)[https://github.com/json-api/json-api/issues/795] about this and I ultimately decided that instead of hacking the format and making really weird controllers I would stick to the requirement that tags must exist before they can be assigned to a breed.

**Testing:** I would like to take the time to get more into the unit tests. Particularly the active_model_serializer custom methods could use coverage. I did learn how to write a serializer unit test for this project, which is cool.
