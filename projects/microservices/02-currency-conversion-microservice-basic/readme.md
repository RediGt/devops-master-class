## Build and Run
Pls build image by yourself to run on MAC m1
```
docker build -t redi2000/currency-conversion:0.0.1
```

<!-- RUN USING --LINK -->
```
docker run -d -p 8100:8100 \
  --name=currency-conversion \
  --link currency-exchange \
  --env CURRENCY_EXCHANGE_SERVICE_HOST=http://currency-exchange \
  redi2000/currency-conversion:0.0.1
```

<!-- LAUNCH AS PART OF NETWORK -->
```
docker network create currency-network

docker run -d -p 8100:8100 \
  --network=currency-network \
  --env CURRENCY_EXCHANGE_SERVICE_HOST=http://currency-exchange \
  --name=currency-conversion \
  redi2000/currency-conversion:0.0.1
```

## Query
- http://localhost:8100/currency-conversion/from/EUR/to/INR/quantity/10

```json
{
id: 10002,
from: "EUR",
to: "INR",
conversionMultiple: 75,
quantity: 10,
totalCalculatedAmount: 750
}
```

### Creating Containers
- mvn package

#### Push
```
docker login
docker push @@@REPO_NAME@@@/currency-conversion:0.0.1-RELEASE
```

#### Environment Variable

```
        env:     #CHANGE
          - name: CURRENCY_EXCHANGE_URI
            valueFrom:
              configMapKeyRef:
                key: CURRENCY_EXCHANGE_URI
                name: currency-exchange-uri-demo
```