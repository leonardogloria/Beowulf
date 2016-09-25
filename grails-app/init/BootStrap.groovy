import beowulf.Institution
import beowulf.Role
import beowulf.Type
import beowulf.User
import beowulf.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def orientadorRole = new Role(authority: 'ROLE_ORIENTADOR').save()

        def testUser = new User(username: 'lsilva@credilink.com.br', password: '123456',firstName: "Leonardo",
        lastName: "Gloria",type: Type.ORIENTADOR,accountLocked: false).save(failOnError:true)

        def testUser2 = new User(username: 'leonardo.gloria@globo.com', password: '123456',firstName: "Cabeca",
                lastName: "de Balde",type: Type.ORIENTANDO,accountLocked: false).save(failOnError:true)



         new Institution(name: "Unipli").save()
         new Institution(name: "Cederj").save()



        UserRole.create testUser, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
        UserRole.create testUser, orientadorRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        UserRole.create testUser2, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }


        assert User.count() == 2
        assert Role.count() == 3
        assert UserRole.count() == 3
        assert Institution.count() == 2
    }
    def destroy = {
    }
}
