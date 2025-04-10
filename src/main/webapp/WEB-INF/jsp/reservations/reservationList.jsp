<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="reservation" items="${reservations}">
    <option value="${reservation.idReservation}">
            ${reservation.idReservation} - ${reservation.dateReservation} - ${reservation.prix} - ${reservation.idTypeSiege}
    </option>
</c:forEach>

