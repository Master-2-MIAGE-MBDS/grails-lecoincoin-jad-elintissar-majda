package mbds_emsii_22_23

import com.emsi.mbds.Annonce
import com.emsi.mbds.Illustration
import com.emsi.mbds.Role
import com.emsi.mbds.User
import com.emsi.mbds.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminUserInstance = new User(username: "admin",password: "admin").save()
        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def userRole = new Role(authority: "ROLE_USER").save()
        def ModRole = new Role(authority: "ROLE_MODERATOR").save()

        UserRole.create(adminUserInstance, adminRole, true)


        // On boucle sur une liste de 5 prénoms
        ["userr", "useefe", "useredwhe", "userewdwe", "userwe"].each {
            String username ->
                // On crée les utilisateurs associés
                def userInstance = new User(username: username, password: "password").save()
                // Pour chaque utilisateur on boucle 5 fois
                (1..3).each {
                    Integer index ->
                        // Pour ajouter 5 annonces par utilisateur
                        def annonceInstance = new Annonce(title: username + " "+ index, description: "Description de l'annonce", price: 10 * index, active: Boolean.TRUE)
                        switch (index) {
                            case 1:
                                ["a1.png","a2.png"].each {
                                    // Et enfin 5 illustrations par annonce
                                    def fn = "a"+(it*index)+".png"
                                    annonceInstance.addToIllustrations(new Illustration(filename: it))
                                }
                                break
                            case 2:
                                ["a3.png","a4.png"].each {
                                    // Et enfin 5 illustrations par annonce
                                    def fn = "a"+(it*index)+".png"
                                    annonceInstance.addToIllustrations(new Illustration(filename: it))
                                }
                                break
                            case 3:
                                ["a5.png","a6.png"].each {
                                    // Et enfin 5 illustrations par annonce
                                    def fn = "a"+(it*index)+".png"
                                    annonceInstance.addToIllustrations(new Illustration(filename: it))
                                }
                                break
                            default:
                                break

                        }

                        // On associe l'annonce créée à l'utilisateur
                        userInstance.addToAnnonces(annonceInstance)
                        // Et on sauvegarde l'utilisateur qui va sauvegarder ses annonces qui sauvegarderont leurs illustrations
                        UserRole.create(userInstance, userRole, true)
                }
        }

    }
    def destroy = {

    }
}
