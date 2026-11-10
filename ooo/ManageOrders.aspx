<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="ooo.ManageOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid p-4">
        <h2 class="text-dark mb-4">Customer Orders</h2>

        <div class="table-responsive bg-white p-3 rounded shadow-sm">
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False"
                CssClass="table table-hover table-striped align-middle border mb-0"
                DataKeyNames="OrderId" OnRowDeleting="gvOrders_RowDeleting">
                <HeaderStyle CssClass="table-dark text-nowrap" />
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" ItemStyle-CssClass="fw-bold text-center" HeaderStyle-CssClass="text-center" />

                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemTemplate>
                            <%# Eval("FirstName") %> <%# Eval("LastName") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total ($)" DataFormatString="{0:F2}" ItemStyle-CssClass="fw-bold text-success" />
                    <asp:BoundField DataField="PaymentMode" HeaderText="Payment Method" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:dd-MM-yyyy HH:mm}" />

                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete"
                                CssClass="btn btn-danger btn-sm text-nowrap px-3"
                                OnClientClick="return confirm('Are you sure you want to delete this order?');">
    <i class="fa fa-trash"></i> Delete Order
                            </asp:LinkButton><asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete"
                                CssClass="btn btn-success btn-sm text-nowrap px-3"
                                OnClientClick="return confirm('Mark this order as completed?');">
    <i class="fa fa-check"></i> Completed
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
