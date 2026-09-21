# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

This is good hen distributing data evenly across all three boats to make actions or workloads being done to the obserations more evenly, and one boat isn't handling most of the data. The main tradeoff is that if we only want to make observations from midnight until 1 AM, some of these observations can be placed in any of the three boats because of the random partitioning and we would have to go through all three boats just to retrieve the relative data from the observations.

## Partitioning by Hour

Partitioning by the hour lets us retrieve relative data from the observations much faster in this situation since the data we are looking for is all available in Boat A. However, this will give a heavier workload for Boat A while not properly utilizing both Boat B and Boat C.

## Partitioning by Hash Value

Partitioning by hash value equally distributes the observations to all three boats, thus also distributing the workload which avoids making one boat overloaded. The main tradeoff is that the hash function produces hash that no longer distributes the observations in chronological order which could potentially make queries that are time sensitive become harder.
