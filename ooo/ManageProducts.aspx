<%@ Page Title="Manage Products" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="ooo.ManageProducts" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
    <style>
        /* Main Page Layout */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            color: #334155;
        }

        .main-content {
            padding: 30px;
            max-width: 1100px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #1a1d24;
            margin-bottom: 24px;
        }

        /* GridView / Table Container */
        .product-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 24px;
            border: none;
        }

            /* Table Header - Exact Dark Color Matching Admin Sidebar */
            .product-table th {
                background-color: #1a1d24 !important;
                color: #ffffff !important;
                padding: 16px 18px;
                text-align: left;
                font-size: 15px;
                font-weight: 600;
                border: none;
            }

            .product-table td {
                padding: 14px 18px;
                border-bottom: 1px solid #f1f5f9;
                vertical-align: middle;
                font-size: 15px;
            }

            .product-table tr:last-child td {
                border-bottom: none;
            }

            .product-table tr:hover {
                background-color: #f8fafc;
            }

        /* Product Image Styling */
        .prod-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
        }

        /* Action Buttons Styling */
        .product-table input[type="button"],
        .product-table input[type="submit"] {
            padding: 7px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            margin-right: 6px;
        }

        /* Edit / Update Button - Dark Slate Blue */
        .product-table input[value="Edit"],
        .product-table input[value="Update"] {
            background-color: #2c3e50 !important;
            color: #ffffff !important;
        }

            .product-table input[value="Edit"]:hover,
            .product-table input[value="Update"]:hover {
                background-color: #1a252f !important;
            }

        /* Delete / Cancel Button - Matching Admin Logout Red Color */
        .product-table input[value="Delete"],
        .product-table input[value="Cancel"] {
            background-color: #e63946 !important;
            color: #ffffff !important;
        }

            .product-table input[value="Delete"]:hover,
            .product-table input[value="Cancel"]:hover {
                background-color: #d62839 !important;
            }

        /* Edit Mode File Upload Input */
        .file-upload-input {
            margin-top: 8px;
            font-size: 13px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-content">
        <h2 class="page-title">Manage Products</h2>

        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"
            CssClass="product-table" GridLines="None"
            OnRowDeleting="gvProducts_RowDeleting"
            OnRowEditing="gvProducts_RowEditing"
            OnRowCancelingEdit="gvProducts_RowCancelingEdit"
            OnRowUpdating="gvProducts_RowUpdating"
            DataKeyNames="ProductID">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Category" HeaderText="Category" />
                <asp:BoundField DataField="Price" HeaderText="Price (₹)" />

                <%-- Image Edit Column --%>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImagePath") %>' CssClass="prod-img" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Image ID="imgCurrent" runat="server" ImageUrl='<%# Eval("ImagePath") %>' CssClass="prod-img" />
                        <asp:HiddenField ID="hfImagePath" runat="server" Value='<%# Eval("ImagePath") %>' />
                        <br />
                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="file-upload-input" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <%-- Edit & Delete Action Buttons --%>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" HeaderText="Action" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
