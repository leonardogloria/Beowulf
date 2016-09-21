import beowulf.Institution
import beowulf.Role
import beowulf.Type
import beowulf.User
import beowulf.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        def testUser = new User(username: 'lsilva2@credilink.com.br', password: '123456',firstName: "Leonardo",
        lastName: "Gloria",type: Type.ORIENTADOR).save(failOnError:true)


         new Institution(name: "Unipli").save()
         new Institution(name: "Cederj").save()




        UserRole.create testUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1
    }
    def destroy = {
    }
}
