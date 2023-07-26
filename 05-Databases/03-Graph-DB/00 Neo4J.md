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

    CREATE (node_name);
    CREATE (student);

Verification

    MATCH (n) RETURN n

### Creating Multiple Nodes

    CREATE (node1),(node2);
    CREATE (student1),(student2);


# Application: The Movie Graph
The Movie Graph is a mini graph application containing actors and directors that are related through the movies they’ve collaborated on. It is helpful if you run the queries and Cypher code to create data as you follow this tutorial.

This tutorial will show you how to:
- Create: Insert movie data into the graph.
- Find: Retrieve individual movies and actors.
- Query: Find patterns in the graph.
- Solve: Answer some questions about the graph.


# References
- [Getting Started with Cypher](https://neo4j.com/docs/getting-started/appendix/tutorials/guide-cypher-basics/)