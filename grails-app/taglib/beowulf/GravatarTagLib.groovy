package beowulf

import grails.converters.JSON

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class GravatarTagLib {
    def springSecurityService
    static namespace = 'gravatar'
    static defaultEncodeAs = [taglib:'html']
    def generateAvatar = {attrs, body ->


        def _loggedUser = springSecurityService.getPrincipal()
        String _encoded = _loggedUser.username
        _encoded = _encoded.encodeAsMD5()
        def _prefixx = "http://www.gravatar.com/avatar/"
        def _sufixx = "?s=64&amp;r=pg&amp;d=mm"

        out << "${_prefixx + _encoded + _sufixx}"

    }
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
}
