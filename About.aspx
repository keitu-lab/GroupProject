
<%@ Page Title="About" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="OffTheGrit1.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Product Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
<style>
.product-gradient {
background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
}
.dark .product-gradient {
background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
}
.image-zoom {
transition: transform 0.5s ease;
}
.image-zoom:hover {
transform: scale(1.05);
}
.slide-in-left {
animation: slideInLeft 0.8s ease-out;
}
.slide-in-right {
animation: slideInRight 0.8s ease-out;
}
@keyframes slideInLeft {
from {
opacity: 0;
transform: translateX(-50px);
}
to {
opacity: 1;
transform: translateX(0);
}
}
@keyframes slideInRight {
from {
opacity: 0;
transform: translateX(50px);
}
to {
opacity: 1;
transform: translateX(0);
}
}
.quantity-button {
transition: all 0.2s ease;
}
.quantity-button:hover {
transform: scale(1.1);
}
.pulse-button {
animation: pulse 2s infinite;
}
@keyframes pulse {
0%, 100% {
transform: scale(1);
}
50% {
transform: scale(1.02);
}
}
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Product Details Section -->
<section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Breadcrumb -->
        <nav class="mb-8">
            <ol class="flex items-center space-x-2 text-sm text-gray-500 dark:text-gray-400">
                <li><a href="./homepage.aspx" class="hover:text-orange-500 transition-colors">Home</a></li>
                <li><span>/</span></li>
<%--                <li><a href='Index.aspx?category=<#Eval("Category_ID")%>' class="hover:text-orange-500 transition-colors">Products</a></li>
                <li><span>/</span></li>--%>
                <li class="text-orange-500 font-medium">Product Details</li>
            </ol>
        </nav>

        <!-- Product Container -->
        <div class="product-gradient rounded-2xl shadow-2xl overflow-hidden">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 p-8 lg:p-12">
                
                <!-- Left: Product Image -->
                <div class="slide-in-left">
                    <div class="relative bg-white dark:bg-gray-800 rounded-2xl p-8 shadow-xl overflow-hidden">
                        <div class="absolute top-4 right-4 z-10">
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200">
                                <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                </svg>
                                In Stock
                            </span>
                        </div>
                        
                        <asp:Image ID="imgProduct" runat="server" 
                                   CssClass="image-zoom w-full h-96 object-contain rounded-xl" />
                    </div>
                </div>

                <!-- Right: Product Info -->
                <div class="slide-in-right flex flex-col">
                    
                    <!-- Product Category Badge -->
                    <div class="mb-4">
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-orange-100 dark:bg-orange-900/20 text-orange-800 dark:text-orange-300">
                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                            </svg>
                            OFF THE GRID Product
                        </span>
                    </div>

                    <!-- Product Title -->
                    <h1 class="text-4xl lg:text-5xl font-bold text-gray-900 dark:text-white mb-4">
                        <asp:Label ID="lblProductName" runat="server" />
                    </h1>

                    <!-- Rating & Reviews -->
                    <div class="flex items-center space-x-4 mb-6">
                        <div class="flex items-center">
                            <svg class="w-5 h-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                            </svg>
                            <svg class="w-5 h-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                            </svg>
                            <svg class="w-5 h-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                            </svg>
                            <svg class="w-5 h-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                            </svg>
                            <svg class="w-5 h-5 text-gray-300 dark:text-gray-600" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                            </svg>
                        </div>
                        <span class="text-sm text-gray-600 dark:text-gray-400">4.0 (127 reviews)</span>
                    </div>

                    <!-- Price -->
                    <div class="mb-8">
                        <div class="flex items-baseline space-x-4">
                            <h2 class="text-4xl font-bold text-orange-500">
                                <asp:Label ID="lblProductPrice" runat="server" />
                            </h2>
                            <span class="text-2xl text-gray-400 dark:text-gray-500 line-through" runat="server" id="lblDiscount"></span>
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 dark:bg-red-900/20 text-red-800 dark:text-red-300">
                                Save 20%
                            </span>
                        </div>
                    </div>

                    <!-- Divider -->
                    <hr class="border-gray-300 dark:border-gray-700 mb-8">

                    <!-- Description -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            Product Description
                        </h3>
                        <p id="description" runat="server" class="text-gray-600 dark:text-gray-300 leading-relaxed text-lg">
                        </p>
                    </div>

                    <!-- Key Features -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            Key Features
                        </h3>
                        <ul class="space-y-3">
                            <li class="flex items-center text-gray-700 dark:text-gray-300">
                                <svg class="w-5 h-5 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                </svg>
                                High quality and durable construction
                            </li>
                            <li class="flex items-center text-gray-700 dark:text-gray-300">
                                <svg class="w-5 h-5 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                </svg>
                                Eco-friendly & energy efficient design
                            </li>
                            <li class="flex items-center text-gray-700 dark:text-gray-300">
                                <svg class="w-5 h-5 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                </svg>
                                Professional installation included
                            </li>
                            <li class="flex items-center text-gray-700 dark:text-gray-300">
                                <svg class="w-5 h-5 mr-3 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                </svg>
                                2-year warranty & lifetime support
                            </li>
                        </ul>
                    </div>

                    <!-- Quantity & Add to Cart -->
                    <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg mb-8">
                        <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-4" id="lblHeading" runat="server">Select Quantity</h3>
                        <div class="flex items-center gap-4" id="divQuantity" runat="server">
                            <div class="flex items-center space-x-3 border border-gray-300 dark:border-gray-600 rounded-xl px-4 py-2">
                                <button type="button" class="quantity-button w-8 h-8 bg-gray-200 dark:bg-gray-600 hover:bg-gray-300 dark:hover:bg-gray-500 text-gray-700 dark:text-gray-300 rounded-full flex items-center justify-center font-bold" onclick="decrementQuantity()">
                                    -
                                </button>
                                <input id="txtQuantity" runat="server" type="number" min="1" value="1" 
                                       class="w-20 text-center text-lg font-semibold bg-transparent border-0 text-gray-900 dark:text-white focus:outline-none" />
                                <button type="button" class="quantity-button w-8 h-8 bg-orange-500 hover:bg-orange-600 text-white rounded-full flex items-center justify-center font-bold" onclick="incrementQuantity()">
                                    +
                                </button>
                            </div>

                            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart"
                                OnClick="btnAdd_Click"
                                CssClass="pulse-button bg-orange-500 hover:bg-orange-600 text-white flex-1 bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white px-8 py-4 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl flex items-center justify-center" />
                        </div>

                        <!-- Admin Edit Button -->
                        <asp:Button ID="btnEdit" Visible="false" runat="server" Text="Edit Product"
                            OnClick="btnEdit_Click"
                            CssClass="mt-4 w-full bg-blue-500 hover:bg-blue-600 text-white px-8 py-4 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 shadow-lg" />
                    </div>

                    <!-- Trust Badges -->
                    <div class="grid grid-cols-3 gap-4">
                        <div class="flex flex-col items-center p-4 bg-green-50 dark:bg-green-900/20 rounded-xl border border-green-200 dark:border-green-800">
                            <svg class="w-8 h-8 text-green-500 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                            </svg>
                            <span class="text-sm font-semibold text-green-700 dark:text-green-300">Secure Payment</span>
                        </div>
                        
                        <div class="flex flex-col items-center p-4 bg-blue-50 dark:bg-blue-900/20 rounded-xl border border-blue-200 dark:border-blue-800">
                            <svg class="w-8 h-8 text-blue-500 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                            </svg>
                            <span class="text-sm font-semibold text-blue-700 dark:text-blue-300">Free Shipping</span>
                        </div>
                        
                        <div class="flex flex-col items-center p-4 bg-orange-50 dark:bg-orange-900/20 rounded-xl border border-orange-200 dark:border-orange-800">
                            <svg class="w-8 h-8 text-orange-500 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                            </svg>
                            <span class="text-sm font-semibold text-orange-700 dark:text-orange-300">Easy Returns</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function incrementQuantity() {
        const input = document.getElementById('<%= txtQuantity.ClientID %>');
        input.value = parseInt(input.value) + 1;
    }

    function decrementQuantity() {
        const input = document.getElementById('<%= txtQuantity.ClientID %>');
        if (parseInt(input.value) > 1) {
            input.value = parseInt(input.value) - 1;
        }
    }

    // Add smooth entrance animations
    document.addEventListener('DOMContentLoaded', function () {
        const elements = document.querySelectorAll('.slide-in-left, .slide-in-right');
        elements.forEach((element, index) => {
            element.style.opacity = '0';

            setTimeout(() => {
                element.style.transition = 'all 0.8s ease';
                element.style.opacity = '1';
            }, index * 200);
        });
    });
</script>
```

</asp:Content>