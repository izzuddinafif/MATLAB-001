# Availability optimisation for stochastic degrading systems under imperfect preventive maintenance
  
- Age reduction model: the age reduction model is defined on the basis of the concept of system virtual age according to which a system becomes younger whenever it undergoes a PM. After an imperfect PM, the age t of the system is reduced to α × t where α is the age reduction coefficient (0 ≤ α ≤ 1). Accordingly, the system becomes as good as new if its age is reset to zero (α = 0) while it becomes as bad as old if the age reduction coefficient α = 1
  
- Hazard rate model:  the imperfect PM could be seen as a replacement of the existing system with a new but less reliable one. In other words, after an imperfect PM, the initial hazard rate h(t) of the system is modified to be β × h(t) where β is such that β ≥ 1 and called the adjustment factor. Following this modelling approach, the hazard rate function increases with the number of imperfect PM carried out.
  
- Hybrid hazard rate model: hybrid model derived by combining age reduction as well as hazard rate increased effects. The hybrid hazard rate model not only reduces the effective age to a certain value, but it further changes the slope of the hazard rate function. If the hazard rate function of the system was h(T ) just before performing a PM at time T, then it becomes β × h(αT + t) right after the PM, where β ≥ 1, 0 ≤ α ≤ 1 and t ≥ 0. When β = 1, the hybrid model reduces to age reduction model, while it reduces to hazard rate adjustment model when α = 0.
  
The present paper proposes a PM optimisation approach for a system which is assumed to be continuously monitored and degrades stochastically. The system undergoes PM whenever its reliability reaches a given threshold level Rth. In the case where the system fails before reaching the threshold Rth, a corrective maintenance (CM) is then carried out. After a number N of maintenance cycles (a maintenance cycle ends either by a CM or a PM which occurs first), the system is replaced by a new one. Both preventive and CM actions are made identically on the basis of the hybrid hazard model. The choice of reliability threshold Rth and number N of maintenance cycles to be experienced before replacing the system by a new one, will obviously have an economic impact on the performance of the maintenance policy. Indeed, on the one hand, a low value of the threshold Rth implies a long and an uninterrupted use of the system but with, however, an increased risk of failures. On the other hand, if the reliability threshold is set to a high value, the number of system failures is then reduced but with an increasing preventive maintenance cost and unavailability. Therefore, the maintenance optimisation problem to be solved consists on finding the joint optimal reliability threshold Rth∗ together with the optimal number N∗
of maintenance cycles to maximise the average availability of the system.

weibull distribution: <https://en.wikipedia.org/wiki/Weibull_distribution#Definition>
  
![alt](https://wikimedia.org/api/rest_v1/media/math/render/svg/05e3bcdfd2495ee90297718ab601e9b167b96b0f)

exp(z) means e to the power of z (e^z)  
![alt](https://wikimedia.org/api/rest_v1/media/math/render/svg/ffd77a26bc18640fb886ed5e6254d4e8e7da3c81)
