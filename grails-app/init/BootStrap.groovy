import beowulf.Institution
import beowulf.Role
import beowulf.Type
import beowulf.User
import beowulf.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        def testUser = new User(username: 'lsilva@credilink.com.br', password: '123456',firstName: "Leonardo",
        lastName: "Gloria",type: Type.ORIENTADOR,accountLocked: false).save(failOnError:true)


         new Institution(name: "Unipli").save()
         new Institution(name: "Cederj").save()



        UserRole.create testUser, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1
        assert Institution.count() == 2
    }
    def destroy = {
    }
}
