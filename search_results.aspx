<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="search_results.aspx.cs" Inherits="OffTheGrit1.search_results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home - Off The Grid
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Navigation -->
    <nav class="bg-gray-900 text-white px-6 py-4 shadow-md flex items-center justify-between">
        <h1 class="text-2xl text-orange-400 font-bold">Off The Grid</h1>
        <div class="flex gap-6 text-sm font-medium">
            <a href="./homepage.aspx" class="hover:text-orange-600">Back to Categories</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="bg-gradient-to-r from-green-600 to-green-400 text-white text-center py-20">
        <h2 class="text-4xl md:text-5xl font-extrabold text-slate-950 dark:text-slate-50 mb-4">Power Your Life, Off The Grid</h2>
        <p class="text-lg md:text-xl dark:text-gray-300 text-gray-600 mb-6">Explore sustainable solutions for energy, water, and security.</p>
        <a href="#products" class="text-slate-50 bg-orange-400 dark:text-slate-50 px-6 py-3 rounded-md font-semibold shadow-lg hover:bg-orange-600">
            Shop Now
        </a>
    </section>

    <!-- Products Section -->
    <section id="products" class="max-w-6xl mx-auto px-6 py-16">
        <h3 class="text-3xl font-bold text-slate-950 dark:text-slate-50 text-center mb-10">Featured Products</h3>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-gray-500" Visible="false"></asp:Label>

        <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            <asp:Repeater ID="waterSection" runat="server">
                <ItemTemplate>
                    <div class="bg-white rounded-2xl dark:bg-slate-800 shadow-lg overflow-hidden hover:scale-105 transition-transform">
                        <a href='About.aspx?prodID=<%# Eval("Product_ID") %>'>
                            <img src='<%# Eval("Product_Image") %>' alt="" class="w-full h-48 object-cover">
                            <div class="p-5">
                                <h4 class="text-lg font-semibold dark:text-slate-50 text-gray-700 mb-2">
                                    <%# Eval("Product_Name") %>
                                </h4>
                                <p class="text-sm text-gray-500">Click to learn more</p>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

   
</asp:Content>
