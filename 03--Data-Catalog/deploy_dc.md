### <font color='red'>Installation of Data Catalog 7.3.0</font>

To download the Data Catalog images and Charts, you will need to contact your Account Manager.

* The artifacts are not publicly available.
* To save time, the artifacts have already been downloaded.

`create a ldc namespace in k3s:`

```
kubectl create namespace ldc
kubectl get namespace
```

`login into the Registry:`

```
docker login -u dc -p lumada data-catalog.skytap.example:5000   
```

`upload images:`
```
cd
cd Packages
./ldc-load-images.sh -i ldc-images-7.3.0.tar.gz -r data-catalog.skytap.example:5000
```
Note: Be patient as the images have to be unpacked and then uploaded.

---

<em>Install Data Catalog</em>

`install Data Catalog:`
```
cd Packages
helm install --wait ldc ldc-7.3.0.tgz -f custom-values.yml -n ldc
```

`check all Pods:`
```
kubectl get all
```

Note: make a note of the dc-agent

---