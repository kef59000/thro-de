# MongoDB
MongoDB is a document database. It stores data in a type of JSON format called BSON. A record in MongoDB is a document, which is a data structure composed of key value pairs similar to the structure of JSON objects.

## SQL vs Document Databases
**SQL databases** are considered relational databases. They store related data in separate tables. When data is needed, it is queried from multiple tables to join the data back together.

**MongoDB** is a document database which is often referred to as a non-relational database. This does not mean that relational data cannot be stored in document databases. It means that relational data is stored differently. A better way to refer to it is as a non-tabular database.

MongoDB stores data in flexible documents. Instead of having multiple tables you can simply keep all of your related data together. This makes reading your data very fast.

You can still have multiple groups of data too. In MongoDB, instead of tables these are called **collections**.

## A MongoDB Document
Records in a MongoDB database are called documents, and the field values may include numbers, strings, booleans, arrays, or even nested documents.

    {
        title: "Post Title 1",
        body: "Body of post.",
        category: "News",
        likes: 1,
        tags: ["news", "events"],
        date: Date()
    }

# Setup
Install Docker Desktop on your local machine. Then, run the following code block: 

    docker pull mongo

The Connection String is as follows

    mongodb://127.0.0.1:27017


# MongoDB Shell (mongosh)
There are many ways to connect to your MongoDB database. We will start by using the MongoDB Shell, mongosh.

    mongosh --version

# MongoDB Query API
The MongoDB Query API is the way you will interact with your data. The MongoDB Query API can be used two ways:
- CRUD Operations
- Aggregation Pipelines

You can use the MongoDB Query API to perform:
- Adhoc queries with mongosh, Compass, VS Code, or a MongoDB driver for the programming language you use.
- Data transformations using aggregation pipelines.
- Document join support to combine data from different collections.
- Graph and geospatial queries.
- Full-text search.
- Indexing to improve MongoDB query performance.
- Time series analysis.


# Create Database
Type

    mongosh

## Show all databases

You can see which database you are using by typing db in your terminal:

    db

To see all available databases, in your terminal type

    show dbs

Notice that empty databases are not listed. This is because an empty database is essentially non-existant.

## Change or Create a Database
You can change or create a new database by typing **use** then the name of the database. Create a new database called "blog":

    use blog

# Create Collection
You can create a collection using the **createCollection()** database method.

    db.createCollection("posts")

# Insert Documents
There are 2 methods to insert documents into a MongoDB database.

## insertOne()
To insert a single document, use the insertOne() method. This method inserts a single object into the database.

    db.posts.insertOne({
        title: "Post Title 1",
        body: "Body of post.",
        category: "News",
        likes: 1,
        tags: ["news", "events"],
        date: Date()
    })

## insertMany()
To insert multiple documents at once, use the insertMany() method. This method inserts an array of objects into the database.

    db.posts.insertMany([  
        {
            title: "Post Title 2",
            body: "Body of post.",
            category: "Event",
            likes: 2,
            tags: ["news", "events"],
            date: Date()
        },
        {
            title: "Post Title 3",
            body: "Body of post.",
            category: "Technology",
            likes: 3,
            tags: ["news", "events"],
            date: Date()
        },
        {
            title: "Post Title 4",
            body: "Body of post.",
            category: "Event",
            likes: 4,
            tags: ["news", "events"],
            date: Date()
        }
    ])

# Find and Query Data
## Find Data
There are 2 methods to find and select data from a MongoDB collection, **find()** and **findOne()**.

### find()
To select data from a collection in MongoDB, we can use the **find()** method. This method accepts a query object. If left empty, all documents will be returned.

    db.posts.find()

### findOne()
To select only one document, we can use the findOne() method. This method accepts a query object. If left empty, it will return the first document it finds.

    db.posts.findOne()

## Querying Data
To query, or filter, data we can include a query in our **find()** or **findOne()** methods.

Example:

    db.posts.find( {category: "News"} )

## Projection
Both find methods accept a second parameter called **projection**. This parameter is an **object** that describes which fields to include in the results. This parameter is optional. If omitted, all fields will be included in the results.

Example: This example will only display the title and date fields in the results.

    db.posts.find({}, {title: 1, date: 1})

Notice that the _id field is also included. This field is always included unless specifically excluded. We use a 1 to include a field and 0 to exclude a field. This time, let's exclude the _id field.

    db.posts.find({}, {_id: 0, title: 1, date: 1})

Note: You cannot use both 0 and 1 in the same object. The only exception is the _id field. You should either specify the fields you would like to include or the fields you would like to exclude.

Let's exclude the date category field. All other fields will be included in the results.

    db.posts.find({}, {category: 0})

# Update
To update an existing document we can use the **updateOne()** or **updateMany()** methods. The first parameter is a query object to define which document or documents should be updated. The second parameter is an object defining the updated data.

## updateOne()
The **updateOne()** method will update the first document that is found matching the provided query.
Let's see what the "like" count for the post with the title of "Post Title 1":

    db.posts.find( { title: "Post Title 1" } ) 


Now let's update the "likes" on this post to 2. To do this, we need to use the **$set** operator.

    db.posts.updateOne( { title: "Post Title 1" }, { $set: { likes: 2 } } ) 

Check the document again and you'll see that the "like" have been updated.

    db.posts.find( { title: "Post Title 1" } ) 

### Insert if not found
If you would like to insert the document if it is not found, you can use the **upsert** option.

Example: Update the document, but if not found insert it

    db.posts.updateOne( 
        { title: "Post Title 5" }, 
        {
            $set: 
            {
                title: "Post Title 5",
                body: "Body of post.",
                category: "Event",
                likes: 5,
                tags: ["news", "events"],
                date: Date()
            }
        }, 
        { upsert: true }
    )

## updateMany()
The **updateMany()** method will update all documents that match the provided query.

Example: Update likes on all documents by 1. For this we will use the **$inc** (increment) operator.

    db.posts.updateMany({}, { $inc: { likes: 1 } })

# Delete Documents
We can delete documents by using the methods **deleteOne()** or **deleteMany()**. These methods accept a query object. The matching documents will be deleted.

## deleteOne()
The **deleteOne()** method will delete the first document that matches the query provided.

    db.posts.deleteOne({ title: "Post Title 5" })

## deleteMany()
The **deleteMany()** method will delete all documents that match the query provided.

    db.posts.deleteMany({ category: "Technology" })

# MongoDB Query Operators
## Comparison
The following operators can be used in queries to compare values:

| Operator      | Description                                       |
| --------      | -------                                           |
| $eq           | Values are equal                                  |
| $ne           | Values are not equal                              |
| $gt           | Value is greater than another value               |
| $gte          | Value is greater than or equal to another value   |
| $lt           | Value is less than another value                  |
| $lte          | Value is less than or equal to another value      |
| $in           | Value is matched within an array                  |

## Logical
The following operators can logically compare multiple queries:

| Operator      | Description                                       |
| --------      | -------                                           |
| $and          | Returns documents where both queries match        |
| $or           | Returns documents where either query matches      |
| $nor          | Returns documents where both queries fail to match|
| $not          | Returns documents where the query does not match  |

## Evaluation
The following operators assist in evaluating documents:

| Operator      | Description                                                           |
| --------      | -------                                                               |
| $regex        | Allows the use of regular expressions when evaluating field values    |
| $text         | Performs a text search                                                |
| $where        | Uses a JavaScript expression to match documents                       |

# MongoDB Update Operators
There are many update operators that can be used during document updates.

## Fields
The following operators can be used to update fields:

| Operator      | Description                                   |
| --------      | -------                                       |
| $currentDate  | Sets the field value to the current date      |
| $inc          | Increments the field value                    |
| $rename       | Renames the field                             |
| $set          | Sets the value of a field                     |
| $unset        | Removes the field from the document           |

## Array
The following operators assist with updating arrays:

| Operator      | Description                                               |
| --------      | -------                                                   |
| $addToSet     | Adds distinct elements to an array                        |
| $pop          | Removes the first or last element of an array             |
| $pull         | Removes all elements from an array that match the query   |
|$push          | Adds an element to an array                               |

# Aggregation Pipelines
Aggregation operations allow you to group, sort, perform calculations, analyze data, and much more. Aggregation pipelines can have one or more "stages". The order of these stages are important. Each stage acts upon the results of the previous stage.

Example:

    db.posts.aggregate([
        // Stage 1: Only find documents that have more than 1 like
        {
            $match: { likes: { $gt: 1 } }
        },
        // Stage 2: Group documents by category and sum each categories likes
        {
            $group: { _id: "$category", totalLikes: { $sum: "$likes" } }
        }
    ])

## $group
This aggregation stage groups documents by the unique **_id** expression provided.

    db.listingsAndReviews.aggregate(
        [ { $group : { _id : "$property_type" } } ]
    )

This will return the distinct values from the property_type field.

## $limit
This aggregation stage limits the number of documents passed to the next stage.

    db.movies.aggregate([ { $limit: 1 } ])

This will return the 1 movie from the collection.

## $project
This aggregation stage passes only the specified fields along to the next aggregation stage.

    db.restaurants.aggregate([
        {
            $project: {
            "name": 1,
            "cuisine": 1,
            "address": 1
            }
        },
        {
            $limit: 5
        }
    ])

This will return the documents but only include the specified fields.

## $sort
This aggregation stage groups sorts all documents in the specified sort order.

    db.listingsAndReviews.aggregate([ 
        { 
            $sort: { "accommodates": -1 } 
        },
        {
            $project: {
            "name": 1,
            "accommodates": 1
            }
        },
        {
            $limit: 5
        }
    ])

This will return the documents sorted in descending order by the accommodates field.

## $match
This aggregation stage behaves like a find. It will filter documents that match the query provided. Using **$match** early in the pipeline can improve performance since it limits the number of documents the next stages must process.

    db.listingsAndReviews.aggregate([ 
        { $match : { property_type : "House" } },
        { $limit: 2 },
        { $project: {
            "name": 1,
            "bedrooms": 1,
            "price": 1
        }}
    ])

This will return the documents sorted in descending order by the accommodates field.

## $addFields
This aggregation stage adds new fields to documents.

    db.restaurants.aggregate([
        {
            $addFields: {
            avgGrade: { $avg: "$grades.score" }
            }
        },
        {
            $project: {
            "name": 1,
            "avgGrade": 1
            }
        },
        {
            $limit: 5
        }
    ])

This will return the documents along with a new field, **avgGrade**, which will contain the average of each restaurants **grades.score**.

## $count
This aggregation stage counts the total amount of documents passed from the previous stage.

    db.restaurants.aggregate([
        {
            $match: { "cuisine": "Chinese" }
        },
        {
            $count: "totalChinese"
        }
    ])

This will return the number of documents at the **$count** stage as a field called "totalChinese".

## $lookup
This aggregation stage performs a left outer join to a collection in the same database.

There are four required fields:
- **from**: The collection to use for lookup in the same database
- **localField**: The field in the primary collection that can be used as a unique identifier in the **from** collection.
- **foreignField**: The field in the **from** collection that can be used as a unique identifier in the primary collection.
- **as**: The name of the new field that will contain the matching documents from the **from** collection.

    db.comments.aggregate([
        {
            $lookup: {
            from: "movies",
            localField: "movie_id",
            foreignField: "_id",
            as: "movie_details",
            },
        },
        {
            $limit: 1
        }
    ])

This will return the movie data along with each comment.

## $out
This aggregation stage writes the returned documents from the aggregation pipeline to a collection.

Note: The **$out** stage must be the last stage of the aggregation pipeline.

    db.listingsAndReviews.aggregate([
        {
            $group: {
            _id: "$property_type",
            properties: {
                $push: {
                name: "$name",
                accommodates: "$accommodates",
                price: "$price",
                },
            },
            },
        },
        { $out: "properties_by_type" },
    ])

The first stage will group properties by the property_type and include the name, accommodates, and price fields for each. The **$out** stage will create a new collection called properties_by_type in the current database and write the resulting documents into that collection.

# MongoDB with Pyhon
Follow [this link](https://www.mongodb.com/docs/drivers/python/?utm_campaign=w3schools_mdb&utm_source=w3schools&utm_medium=referral).

# References
- [MongoDB Tutorial (W3Schools)](https://www.w3schools.com/mongodb/index.php)
- [MongoDB Tutorial (tutorialspoint)](https://www.tutorialspoint.com/mongodb/index.htm)