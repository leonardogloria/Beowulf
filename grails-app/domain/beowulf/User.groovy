package beowulf

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName

	Type type
	static hasMany = [institutions: Institution, validations:ValidationLogin,timeLine:TimeLine]


	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Date userSince = new Date()
	PersonalInfo personalInfo = new PersonalInfo()


	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}
	public String getFullName(){
		"${firstName + " " + lastName}"
	}
	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		institutions nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
enum Type {
	ORIENTADOR("Orientador"), ORIENTANDO("Orientando")

	Type(String name){
		this.name = name

	}
	String name


}
