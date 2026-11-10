<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ooo.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add New Product</h2>
    <div class="row col-md-6">
        <asp:Label ID="lblMsg" runat="server" CssClass="fw-bold"></asp:Label>

        <div class="mb-3">
            <label>Product Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label>Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                <asp:ListItem Value="">Select Category</asp:ListItem>
                <asp:ListItem Value="Necklaces">Necklaces</asp:ListItem>
                <asp:ListItem Value="Earrings">Earrings</asp:ListItem>
                <asp:ListItem Value="Rings">Rings</asp:ListItem>
                <asp:ListItem Value="Bangles">Bangles & Bracelets</asp:ListItem>
                <asp:ListItem Value="Pendants">Pendants</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="mb-3">
            <label>Price (₹)</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label>Product Image</label>
            <asp:FileUpload ID="fileImg" runat="server" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label>Description</label>
            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="btnSave" runat="server" Text="Save Product" OnClick="btnSave_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>
