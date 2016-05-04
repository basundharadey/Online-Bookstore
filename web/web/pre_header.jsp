<%@include file="db_config.jsp" %>

<%
    session.setAttribute("filename", filename);
    ArrayList errors = new ArrayList();
%>

<%!
    String isNull(String str)
    {
        if(str == null)
        {
            return "";
        }
        else
        {
            return str;
        }
    }
%>

<%
    class MyCart
    {
        public String isbn;
        public int quantity;

        public void setValues(String isbn, int quantity)
        {
            this.isbn = isbn;
            this.quantity = quantity;
        }
    }

    MyCart myCart = new MyCart();
%>