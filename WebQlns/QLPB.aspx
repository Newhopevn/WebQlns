<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLPB.aspx.cs" Inherits="WebQlns.QLPB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    <asp:SqlDataSource ID="DSPB" runat="server" ConnectionString="<%$ ConnectionStrings:DSNVConnectionString2 %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
    
    <div class="row w-25 m-auto">
        <div class="col-md-12 form-inline">
            Chọn phòng ban: <asp:DropDownList ID="DLPB" runat="server" DataSourceID="DSPB" DataTextField="TenPhong" DataValueField="MaPhong" AutoPostBack="True"></asp:DropDownList>
    </div>
    </div>
            <asp:SqlDataSource ID="DSPBNV" runat="server" ConnectionString="<%$ ConnectionStrings:DSNVConnectionString3 %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DLPB" Name="MaPhong" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
       
</asp:SqlDataSource>
    
    <asp:GridView
        CssClass="table table-bordered table-hover" PageSize="4" ID="GRPB" runat="server" AutoGenerateColumns="False" DataKeyNames="MaNV" DataSourceID="DSPBNV" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="MaNV" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
            <asp:BoundField DataField="HoNV" HeaderText="HoNV" SortExpression="HoNV" />
            <asp:BoundField DataField="TenNV" HeaderText="TenNV" SortExpression="TenNV" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phai" SortExpression="Phai" />
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="MaPhong" HeaderText="MaPhong" SortExpression="MaPhong" />

        </Columns>
        
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                Ko có nhân viên nào thuộc  phòng ban này :))

            </div>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
       
</asp:Content>
