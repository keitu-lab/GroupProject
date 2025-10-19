<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit_product.aspx.cs" Inherits="OffTheGrit1.edit_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Edit Product
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <h1 class="text-4xl font-extrabold text-gray-900 dark:text-white mb-10 text-center">
        Edit Product
    </h1>

    <!-- Product Edit Section -->
    <section class="max-w-7xl mx-auto px-6 py-12">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-start">
            
            <!-- Left: Product Image + Image Path -->
            <div class="flex flex-col items-center gap-6 w-full">
                <!-- Product Image -->
                <asp:Image ID="imgProduct" runat="server" 
                           CssClass="rounded-2xl shadow-xl max-h-[500px] object-contain w-full md:w-[90%]" />

                <!-- Image Path Input -->
                <asp:TextBox ID="txtImage" runat="server"
                    CssClass="border dark:text-slate-50 dark:border-gray-600 rounded-lg px-3 py-2 w-full 
                              focus:ring-2 focus:ring-green-500 focus:outline-none"
                    placeholder="Image Path"></asp:TextBox>
            </div>

            <!-- Right: Editable Fields -->
            <div class="flex flex-col gap-6">

                <!-- Product Name -->
                <asp:TextBox ID="txtName" runat="server" 
                    CssClass="border dark:text-slate-50 dark:border-gray-600 rounded-lg px-3 py-2 w-full 
                              focus:ring-2 focus:ring-green-500 focus:outline-none"
                    placeholder="Product Name"></asp:TextBox>

                <!-- Price -->
                <asp:TextBox ID="txtPrice" runat="server"
                    CssClass="border dark:text-slate-50 dark:border-gray-600 rounded-lg px-3 py-2 w-full 
                              focus:ring-2 focus:ring-green-500 focus:outline-none"
                    placeholder="Product Price"></asp:TextBox>

                <!-- Description -->
                <asp:TextBox ID="txtDescription" runat="server"  TextMode="MultiLine" Rows="5"
                    CssClass="border dark:text-slate-50 dark:border-gray-600 rounded-lg px-3 py-2 w-full 
                              focus:ring-2 focus:ring-green-500 focus:outline-none"
                    placeholder="Product Description"></asp:TextBox>

                <!-- Category -->
                <asp:TextBox ID="txtCategory" runat="server"
                    CssClass="border dark:text-slate-50 dark:border-gray-600 rounded-lg px-3 py-2 w-full 
                              focus:ring-2 focus:ring-green-500 focus:outline-none"
                    placeholder="Product Category"></asp:TextBox>

                <!-- Stock / Quantity -->
                <asp:TextBox ID="txtQuantity" runat="server"
                    CssClass="border dark:text-slate-50 dark:border-gray-600 rounded-lg px-3 py-2 w-full 
                              focus:ring-2 focus:ring-green-500 focus:outline-none"
                    placeholder="Stock Quantity"></asp:TextBox>

                    <%--response label--%>
                    <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>
                <!-- Buttons -->
                <div class="flex items-center gap-4 mt-6">
                    <asp:Button ID="btnApplyChanges" runat="server" Text="Apply Changes"
                        CssClass="bg-green-600 hover:bg-green-700 text-white 
                                 px-6 py-3 rounded-lg font-semibold shadow-md 
                                 cursor-pointer transition transform hover:scale-105" OnClick="btnApplyChanges_Click"  />

                    <asp:Button ID="btnDeleteProduct" runat="server" Text="Delete Product"
                        CssClass="bg-red-600 hover:bg-red-700 text-white 
                                 px-6 py-3 rounded-lg font-semibold shadow-md 
                                 cursor-pointer transition transform hover:scale-105" OnClick="btnDeleteProduct_Click"  />
                </div>
            </div>
        </div>
    </section>
</asp:Content>
