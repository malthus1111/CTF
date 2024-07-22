
1. Fonction contribute()

Faille: La fonction contribute() ne vérifie pas si le contributeur est déjà le propriétaire avant de mettre à jour le propriétaire. Cela peut être exploité pour devenir propriétaire en envoyant une petite contribution répétée.

Solution: Contribuer une petite quantité d'Ether (moins de 0.001 Ether) pour devenir le propriétaire.

2. Fonction flip(bool _guess)
Faille: La fonction flip() utilise la valeur de hash du bloc précédent pour générer un résultat prévisible en utilisant FACTOR.

Solution: Calcule la valeur prévisible et appelle flip() avec le bon _guess.

3. Fonction addPoint()
Faille: La fonction addPoint() ajoute des points à l'appelant si tx.origin et msg.sender sont différents.

Solution: Utiliser un contrat intermédiaire pour appeler addPoint().

4. Fonction transfer(address _to, uint256 _value)
Faille: La fonction transfer() vérifie incorrectement si le solde de l'appelant est suffisant en utilisant une soustraction qui pourrait échouer.

Solution: S'assurer d'avoir suffisamment de balance avant d'appeler transfer().

5. Fonction goTo(uint256 _floor)
Faille: La fonction goTo() dépend de l'implémentation de Building.isLastFloor.

Solution: Créer un contrat Building qui retourne une valeur souhaitée pour isLastFloor.

6. Fonction sendKey(bytes16 _key)
Faille: La fonction sendKey() vérifie la clé par rapport à une valeur connue dans data.

Solution: Appeler sendKey avec la clé correcte.

7. Fonction sendPassword(bytes32 _password)
Faille: La fonction sendPassword() vérifie le mot de passe par rapport à une valeur connue.

Solution: Appeler sendPassword avec le mot de passe correct.


8. Fonction receive() external payable
Faille: La fonction receive() ajoute des points si certaines conditions sont remplies.

Solution: Envoyer de l'Ether au contrat et remplir les conditions.