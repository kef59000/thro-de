# Neo4J
This tutorial explains the basic concepts of Cypher®, Neo4j’s query language, including how to create and query graphs. You should be able to read and understand Cypher queries after finishing this tutorial.

# Setup
Install Docker Desktop on your local machine. Then, run the following code block: 

    docker pull neo4j

Then, run the following command. This allows you to access neo4j through your browser at http://localhost:7474.

    docker run --publish=7474:7474 --publish=7687:7687 neo4j

- Your initial user is: **neo4j**
- Your initial password is: **neo4j**

# First Steps
## Creating Nodes

    CREATE (node_name)
    CREATE (student)

Verification

    MATCH (n) RETURN n

### Creating Multiple Nodes

    CREATE (node1),(node2)
    CREATE (student1),(student2)

### Creating a Node with a Label
A label in Neo4j is used to group (classify) the nodes using labels. You can create a label for a node in Neo4j using the CREATE clause.

    CREATE (node:label);
    CREATE (Dhawan:player)

### Creating a Node with Multiple Labels
You can also create multiple labels for a single node. You need to specify the labels for the node by separating them with a colon “ : ”.

    CREATE (node:label1:label2:. . . . labeln)
    CREATE (Dhawan:person:player)

### Create Node with Properties
Properties are the key-value pairs using which a node stores data. You can create a node with properties using the CREATE clause. You need to specify these properties separated by commas within the flower braces “{ }”.

    CREATE (node:label { key1: value, key2: value, . . . . . . . . .  })
    CREATE (Dhawan:player{name: "Shikar Dhawan", YOB: 1985, POB: "Delhi"})

### Returning the Created Node
Throughout this section, we used the MATCH (n) RETURN n query to view the created nodes. This query returns all the existing nodes in the database.

Instead of this, we can use the RETURN clause with CREATE to view the newly created node.

    CREATE (Node:Label{properties. . . . }) RETURN Node
    CREATE (Dhawan:player{name: "Shikar Dhawan", YOB: 1985, POB: "Delhi"}) RETURN Dhawan;

## Creating a Relationship
We can create a relationship using the CREATE clause. We will specify relationship within the square braces “[ ]” depending on the direction of the relationship it is placed between hyphen “ - ” and arrow “ → ” as shown in the following syntax.

    CREATE (node1)-[:RelationshipType]->(node2)

Example:

    CREATE (Dhawan:player{name: "Shikar Dhawan", YOB: 1985, POB: "Delhi"})
    CREATE (Ind:Country {name: "India"})
    CREATE (Dhawan)-[r:BATSMAN_OF]->(Ind)
    RETURN Dhawan, Ind

### Creating a Relationship Between the Existing Nodes

    MATCH (a:LabeofNode1), (b:LabeofNode2) 
        WHERE a.name = "nameofnode1" AND b.name = " nameofnode2" 
    CREATE (a)-[: Relation]->(b) 
    RETURN a,b 

    MATCH (a:player), (b:Country) WHERE a.name = "Shikar Dhawan" AND b.name = "India" 
    CREATE (a)-[r: BATSMAN_OF]->(b) 
    RETURN a,b


### Creating a Relationship with Label and Properties

    CREATE (node1)-[label:Rel_Type {key1:value1, key2:value2, . . . n}]-> (node2)

    MATCH (a:player), (b:Country) WHERE a.name = "Shikar Dhawan" AND b.name = "India" 
    CREATE (a)-[r:BATSMAN_OF {Matches:5, Avg:90.75}]->(b)  
    RETURN a,b

### Creating a Complete Path
In Neo4j, a path is formed using continuous relationships. A path can be created using the create clause.

    CREATE p = (Node1 {properties})-[:Relationship_Type]->
        (Node2 {properties})[:Relationship_Type]->(Node3 {properties}) 
    RETURN p

    CREATE p = (Dhawan {name:"Shikar Dhawan"})-[:TOPSCORRER_OF]->(Ind {name:"India"})-[:WINNER_OF]->(CT2013 {name:"Champions Trophy 2013"}) 
    RETURN p

## Match Clause
### Get All Nodes Using Match
Using the MATCH clause of Neo4j you can retrieve all nodes in the Neo4j database.

    CREATE (Dhoni:player {name: "MahendraSingh Dhoni", YOB: 1981, POB: "Ranchi"}) 
    CREATE (Ind:Country {name: "India", result: "Winners"}) 
    CREATE (CT2013:Tornament {name: "ICC Champions Trophy 2013"}) 
    CREATE (Ind)-[r1:WINNERS_OF {NRR:0.938 ,pts:6}]->(CT2013) 

    CREATE(Dhoni)-[r2:CAPTAIN_OF]->(Ind)  
    CREATE (Dhawan:player{name: "shikar Dhawan", YOB: 1995, POB: "Delhi"}) 
    CREATE (Jadeja:player {name: "Ravindra Jadeja", YOB: 1988, POB: "NavagamGhed"})  

    CREATE (Dhawan)-[:TOP_SCORER_OF {Runs:363}]->(Ind) 
    CREATE (Jadeja)-[:HIGHEST_WICKET_TAKER_OF {Wickets:12}]->(Ind) 

    MATCH (n) RETURN n


### Getting All Nodes Under a Specific Label

    MATCH (node:label) 
    RETURN node

    MATCH (n:player) 
    RETURN n 


### Match by Relationship

    MATCH (node:label)<-[: Relationship]-(n) 
    RETURN n

    MATCH (Ind:Country {name: "India", result: "Winners"})<-[: TOP_SCORER_OF]-(n) 
    RETURN n.name

### Delete All Nodes

    MATCH (n) detach delete n

## Where Clause
Like SQL, Neo4j CQL has provided WHERE clause in CQL MATCH command to filter the results of a MATCH Query.

    MATCH (label)  
    WHERE label.country = "property" 
    RETURN label

Example:

    CREATE(Dhawan:player{name:"shikar Dhawan", YOB: 1985, runs:363, country: "India"})
    CREATE(Jonathan:player{name:"Jonathan Trott", YOB:1981, runs:229, country:"South Africa"})
    CREATE(Sangakkara:player{name:"Kumar Sangakkara", YOB:1977, runs:222, 
    country:"Srilanka"})
    CREATE(Rohit:player{name:"Rohit Sharma", YOB: 1987, runs:177, country:"India"})
    CREATE(Virat:player{name:"Virat Kohli", YOB: 1988, runs:176, country:"India"})
    CREATE(Ind:Country {name: "India", result: "Winners"})

Following is a sample Cypher Query which returns all the players (nodes) that belongs to the country India using WHERE clause.

    MATCH (player)  
    WHERE player.country = "India" 
    RETURN player


### WHERE Clause with Multiple Conditions

    MATCH (emp:Employee)  
    WHERE emp.name = 'Abc' AND emp.name = 'Xyz' 
    RETURN emp

Example:

    MATCH (player)  
    WHERE player.country = "India" AND player.runs >=175 
    RETURN player

### Using Relationship with Where Clause

    MATCH (n) 
    WHERE (n)-[: TOP_SCORER_OF]->( {name: "India", result: "Winners"}) 
    RETURN n

# Further Reading
See [here](https://www.tutorialspoint.com/neo4j/index.htm).

# Application: The Movie Graph
The Movie Graph is a mini graph application containing actors and directors that are related through the movies they’ve collaborated on. It is helpful if you run the queries and Cypher code to create data as you follow this tutorial.

This tutorial will show you how to:
- Create: Insert movie data into the graph.
- Find: Retrieve individual movies and actors.
- Query: Find patterns in the graph.
- Solve: Answer some questions about the graph.


# References
- [Getting Started with Cypher](https://neo4j.com/docs/getting-started/appendix/tutorials/guide-cypher-basics/)
- [Neo4j Tutorial](https://www.tutorialspoint.com/neo4j/index.htm)