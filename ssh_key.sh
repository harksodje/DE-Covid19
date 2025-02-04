# ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f filename
kubectl create secret generic airflow-git-ssh-secret \
  --from-file=gitSshKey=${HOME}/.ssh/github_ariflow \
  --from-file=known_hosts=${HOME}/.ssh/known_hosts \
  --from-file=id_ed25519.pub=${HOME}/.ssh/github_ariflow.pub \
  -n airflow

kubectl patch secret  airflow-git-ssh-secret -n airflow -p '{"data": {"known_hosts": "fDF8OHJlN2xpTlRIQTMzWFBhTnFaZDdhUzIweExFPXx1Rk5FelZpZUNENGNTeVNvc09hR3ViSnBGUGs9IHNzaC1lZDI1NTE5IEFBQUFDM056YUMxbFpESTFOVEU1QUFBQUlCQWk2WlVteTFvVDRiZGNJSWhmUnF2WUloeTN2cXpHaC9rRlRlSStCTzF0CnwxfEUrSU40NlZzbHVxRjFFcDkzZk9iM2VlcWlOWT18NWVMRkNDNXVlV2JVbW1vd3kyU2pVd1BFNjhRPSBlY2RzYS1zaGEyLW5pc3RwMjU2IEFBQUFFMlZqWkhOaExYTm9ZVEl0Ym1semRIQXlOVFlBQUFBSWJtbHpkSEF5TlRZQUFBQkJCRWV4RHhqRHc1bmF0ZUEzL3Uxb0RrcVAxdHhIWG1LT1Zadi9rajZrRTh6cEdESWlxSHpEUEg0bUlHUUVJbVZCZ2t3MnZsSDljbEE2MTBoekdLYzEvZEU9CmdpdGh1Yi5jb20gc3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSU9NcXFua1Z6cm0wU2RHNlVPb3FLTHNhYmdINUM5b2tXaTBkaDJsOUdLSmwKZ2l0aHViLmNvbSBlY2RzYS1zaGEyLW5pc3RwMjU2IEFBQUFFMlZqWkhOaExYTm9ZVEl0Ym1semRIQXlOVFlBQUFBSWJtbHpkSEF5TlRZQUFBQkJCRW1LU0VOalFFZXpPbXhrWk15N29wS2d3RkI5bmt0NVlScllNak51RzVOODd1UmdnNkNMcmJvNXdBZFQveTZ2MG1LVjBVMncwV1oyWUIvKytUcG9ja2c9CmdpdGh1Yi5jb20gc3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCZ1FDajduZE54UW93Z2NRbmpzaGNMcnFQRWlpcGhudCtWVFR2RFA2bUhCTDlqMWFOVWtZNFVlMWd2d25HTFZsT2hHZVlyblphTWdSSzYrUEtDVVhhRGJDN3F0Ylc4Z0lraEw3YUdDc09yL0M1NlNKTXkvQkNaZnhkMW5XekFPeFNEUGdWc21lck9CWWZOcWx0VjkvaFdDcUJ5d0lOSVIrNWRJZzZKVEo3MnBjRXBFamNZZ1hrRTJZRUZYVjFKSG5zS2diTFdObGhTY3FiMlVteVJrUXl5dFJMdEwrMzhUR3hreENmbG1PKzVaOENTU05ZN0dpZGpNSVo3UTR6TWpBMm4xbkdybFREa3p3RENzdyt3cUZQR1FBMTc5Y25mR1dPV1JWcnVqMTZ6Nlh5dnh2akp3Ynowd1FaNzVYSzV0S1NiN0ZOeWVJRXM0VFQ0amsrUzRkaFBlQVVDNXkrYkRZaXJZZ000R0M3dUVuenRuWnlhVldRN0IzODFBSzRRZHJ3dDUxWnFFeEtiUXBUVU5uK0VqcW9Ud3ZxTmo0a3F4NVFVQ0kwVGhTL1lrT3hKQ1htUFVXWmJoanBDZzU2aSsyYUI2Q21LMkpHaG41N0s1bWowTU5kQlhBNC9XbndINlhvUFdKeks1Tnl1MnpCM25BWnArUzVocFFzK3Axdk4xL3dzams9"}}'to be read from the Webserver Secret Key Secret

to be read from the Webserver Secret Key Secret

