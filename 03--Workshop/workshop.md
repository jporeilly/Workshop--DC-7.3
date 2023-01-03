### <font color='red'>Workshop - Data Catalog 7.1.0</font>

* Upload flight-delay-data
* Copy over postgresql driver


`retrive DC Agent Pod name:`

```
kubectl get pods -n ldc
```

`retrieve init-Container name:`

```
kubectl get pod POD_NAME_HERE -n ldc -o jsonpath="{.spec['containers','initContainers'][*].name}"
```

`copy over postgresql driver:`

```
cd Workshop--DC/01--Pre-flight/resources
kubectl cp postgresql-42.3.4.jar ldc/ldc-agent-xxxxx:/opt/ldc/agent/ext --container=agent
```

Note: You can also copy over the driver in MinIO.

---

<em>MinIO</em>

MinIO offers high-performance, S3 compatible object storage. Native to Kubernetes, MinIO is the only object storage suite available on every public cloud, every Kubernetes distribution, the private cloud and the edge.

The minIO browser enables you to view the defined storage buckets.

> navigate to: http://data-catalog.skytap.example:30900/minio/login

Access Key: minioadmin\
Secret Key: minioadmin

Note: the keys have been set in the values.yml

```
select: ldc-discovery-cache/ext/jdbc
drag & drop the postgresql-42.3.4.jar onto the canvas
```

Note: these minIO buckets are defined in the values.yml

* ldc: Big Data jar files
* ldc-demo-data: demo data
* ldc-discovery-cache: persistent jdbc drivers
* spark-history: history of spark jobs / events

---
