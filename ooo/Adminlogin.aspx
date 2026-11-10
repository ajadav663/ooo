<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="ooo.Adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-container {
            max-width: 550px;
            margin: 30px 0 0 30px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-title {
            font-size: 28px;
            font-weight: 500;
            color: #1a1a1a;
            margin-bottom: 25px;
            font-family: 'Georgia', serif;
        }

        .form-group {
            margin-bottom: 20px;
        }

            .form-group label {
                display: block;
                font-size: 15px;
                color: #222222;
                margin-bottom: 6px;
            }

        .form-control {
            width: 100% !important;
            padding: 10px 12px !important;
            border: 1px solid #dcdcdc !important;
            border-radius: 6px !important;
            background-color: #ffffff !important;
            font-size: 14px !important;
            box-sizing: border-box !important;
            outline: none;
        }

            .form-control:focus {
                border-color: #8B4513 !important;
            }

        /* Brown Login Button (Same as Save Product) */
        .btn-login {
            width: 100% !important;
            padding: 12px !important;
            background-color: #7a4300 !important; /* Same Brown Color */
            color: #ffffff !important;
            border: none !important;
            border-radius: 6px !important;
            font-size: 16px !important;
            font-weight: 500 !important;
            cursor: pointer !important;
            margin-top: 10px !important;
            transition: background-color 0.2s ease !important;
        }

            .btn-login:hover {
                background-color: #5c3200 !important;
            }

        .error-message {
            color: red;
            display: block;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <h2 class="form-title">Admin Login</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>

        <div class="form-group">
            <label>Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-login" />
    </div>
</asp:Content>
