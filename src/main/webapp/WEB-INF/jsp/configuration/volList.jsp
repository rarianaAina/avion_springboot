<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <c:forEach var="vol" items="${vols}">
            <option value="${vol.idVol}">
                    ${vol.idVol} - ${vol.villeDepart.nom} vers ${vol.villeArrivee.nom} le ${vol.dateVol}
            </option>
        </c:forEach>

