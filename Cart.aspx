<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OffTheGrit1.Cart" %>

<%@ Import Namespace="OffTheGrit1.ServiceReference1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Shopping Cart
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .cart-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }

        .dark .cart-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }

        .cart-item-card {
            transition: all 0.3s ease;
        }

            .cart-item-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            }

        .dark .cart-item-card:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .quantity-button {
            transition: all 0.2s ease;
        }

            .quantity-button:hover {
                transform: scale(1.1);
            }

            .quantity-button:active {
                transform: scale(0.95);
            }

        .checkout-pulse {
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

        .slide-in {
            animation: slideIn 0.6s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Shopping Cart Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">

            <!-- Header -->
            <div class="text-center mb-12">
                <div class="flex items-center justify-center mb-4">
                    <div class="w-12 h-12 bg-orange-500 rounded-full flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                        </svg>
                    </div>
                    <h1 class="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white">Shopping <span class="text-orange-500">Cart</span>
                    </h1>
                </div>
                <p class="text-lg text-gray-600 dark:text-gray-300">
                    Review your OFF THE GRID products before checkout
               
                </p>
                <div class="w-24 h-1 bg-orange-500 mx-auto rounded-full mt-4"></div>
            </div>

            <!-- Cart Container -->
            <div class="cart-gradient rounded-2xl shadow-2xl p-8">

                <!-- Cart Header -->
                <div class="flex items-center justify-between mb-8">
                    <h2 id="lblHeader" runat="server" class="text-2xl font-bold text-gray-900 dark:text-white flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                        </svg>
                        Your Shopping Cart
                    </h2>
                    <div class="flex items-center space-x-2 text-sm text-gray-500 dark:text-gray-400">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                        </svg>
                        <span>Secure Checkout</span>
                    </div>
                </div>

                <!-- Cart Items -->
                <div class="space-y-4 mb-8">
                    <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                        <ItemTemplate>
                            <div class="slide-in cart-item-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-md border border-gray-200 dark:border-gray-700">
                                <div class="grid grid-cols-1 lg:grid-cols-6 gap-6 items-center">

                                    <!-- Product Image -->
                                    <div class="lg:col-span-1">
                                        <div class="w-24 h-24 mx-auto lg:mx-0 rounded-xl overflow-hidden shadow-md">
                                            <img src="<%# Eval("Key.Product_Image") %>"
                                                alt="<%# Eval("Key.Product_Name") %>"
                                                class="w-full h-full object-cover" />
                                        </div>
                                    </div>

                                    <!-- Product Details -->
                                    <div class="lg:col-span-2 text-center lg:text-left">
                                        <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-2">
                                            <%# Eval("Key.Product_Name") %>
                                        </h3>
                                        <div class="flex items-center justify-center lg:justify-start space-x-2">
                                            <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200">
                                                <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                                </svg>
                                                In Stock
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Unit Price -->
                                    <div class="lg:col-span-1 text-center">
                                        <p class="text-sm text-gray-500 dark:text-gray-400">Unit Price</p>
                                        <p class="text-xl font-bold text-orange-500">
                                            R<%# Eval("Key.Product_Price", "{0:F2}") %>
                                        </p>
                                    </div>

                                    <!-- Quantity Controls -->
                                    <div class="lg:col-span-1">
                                        <p class="text-sm text-gray-500 dark:text-gray-400 text-center mb-2">Quantity</p>
                                        <div class="flex items-center justify-center space-x-3">
                                            <asp:Button ID="btnDecrement" runat="server"
                                                CommandName="Decrement"
                                                CommandArgument='<%# ((Product)Eval("Key")).Product_ID %>'
                                                Text="-"
                                                CssClass="quantity-button w-8 h-8 bg-gray-200 dark:bg-gray-600 hover:bg-gray-300 dark:hover:bg-gray-500 text-gray-700 dark:text-gray-300 rounded-full flex items-center justify-center font-bold transition-all duration-200" />

                                            <asp:TextBox ID="txtQuantity" runat="server"
                                                Text='<%# Eval("Value") %>'
                                                ReadOnly="true"
                                                CssClass="w-16 text-center py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white font-semibold" />

                                            <asp:Button ID="btnIncrement" runat="server"
                                                CommandName="Increment"
                                                CommandArgument='<%# ((Product)Eval("Key")).Product_ID %>'
                                                Text="+"
                                                CssClass="quantity-button w-8 h-8 bg-orange-500 hover:bg-orange-600 text-white rounded-full flex items-center justify-center font-bold transition-all duration-200" />
                                        </div>
                                    </div>

                                    <!-- Actions & Total -->
                                    <div class="lg:col-span-1 text-center">
                                        <p class="text-sm text-gray-500 dark:text-gray-400">Item Total</p>
                                        <p class="text-xl font-bold text-gray-900 dark:text-white mb-3">
                                            R<%# String.Format("{0:F2}", Convert.ToDecimal(Eval("Key.Product_Price")) * Convert.ToInt32(Eval("Value"))) %>
                                        </p>

                                        <asp:Button ID="btnRemove" runat="server"
                                            CommandName="Remove"
                                            CommandArgument='<%# ((Product)Eval("Key")).Product_ID %>'
                                            Text="Remove"
                                            CssClass="flex items-center justify-center px-3 py-1 text-xs font-medium text-red-600 dark:text-red-400 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 rounded-lg hover:bg-red-100 dark:hover:bg-red-900/30 transition-all duration-200 mx-auto" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Empty Cart Message -->
                <div id="emptyCart" class="text-center py-12 hidden">
                    <svg class="w-16 h-16 mx-auto text-gray-400 dark:text-gray-500 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-2">Your cart is empty</h3>
                    <p class="text-gray-500 dark:text-gray-400 mb-6">Looks like you haven't added any items yet.</p>
                    <a href="./homepage.aspx" class="inline-flex items-center px-6 py-3 bg-orange-500 hover:bg-orange-600 text-white rounded-xl font-semibold transition-all duration-300">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                        </svg>
                        Continue Shopping
                    </a>
                </div>

                <!-- Cart Summary -->
                <div class="border-t border-gray-200 dark:border-gray-700 pt-8">
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-end">

                        <!-- Order Summary -->
                        <div class="mb-6 md:mb-0">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-4">Order Summary</h3>
                            <div class="space-y-2 text-gray-600 dark:text-gray-300">
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                                    </svg>
                                    <span>Free shipping on orders over R2000</span>
                                </div>
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                                    </svg>
                                    <span>30-day money back guarantee</span>
                                </div>
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                    </svg>
                                    <span>Secure payment processing</span>
                                </div>
                            </div>
                        </div>

                        <!-- Cart Total -->
                        <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border border-gray-200 dark:border-gray-700 min-w-80">
                            <div class="space-y-3">
                                <div class="flex justify-between items-center py-2 border-b border-gray-200 dark:border-gray-700">
                                    <span class="text-gray-600 dark:text-gray-400">Subtotal:</span>
                                    <span class="font-medium text-gray-900 dark:text-white">R<asp:Label ID="lblCartTotal" runat="server" />
                                    </span>
                                </div>

                                <div class="flex justify-between items-center py-2 border-b border-gray-200 dark:border-gray-700">
                                    <span class="text-gray-600 dark:text-gray-400">Shipping:</span>
                                    <span id="lblShipping" runat="server" class="font-medium text-green-600 dark:text-green-400"></span>
                                </div>

                                <div class="flex justify-between items-center py-3 bg-orange-50 dark:bg-orange-900/20 rounded-lg px-4 border-2 border-orange-200 dark:border-orange-800">
                                    <span class="text-lg font-bold text-orange-700 dark:text-orange-300">Total:</span>
                                    <span class="text-xl font-bold text-orange-700 dark:text-orange-300">R<asp:Label ID="lblFinalTotal" runat="server" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="space-y-6">

                        <div class="relative">
                            <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                                Address
                       
                            </label>
                            <asp:TextBox ID="txtAddress" runat="server"
                                CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                                placeholder="Enter your full address" />
                        </div>


                        <div class="relative">
                            <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                                Card Holder Name
                       
                            </label>
                            <asp:TextBox ID="txtCardHolderName" runat="server"
                                CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                                placeholder="Enter the card holder name" />
                        </div>
                        <div class="relative">
                            <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                                Card Number
                       
                            </label>
                            <asp:TextBox ID="txtCardNumber" runat="server"
                                CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                                placeholder="Enter the card number" 
                                type="Password"/>
                        </div>

                        <div class="relative">
                            <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                                CVV
                       
                            </label>
                            <asp:TextBox ID="txtCVV" runat="server"
                                CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                                placeholder="Enter the cvv number"
                                type="Password"/>
                        </div>

                        <div class="relative">
                            <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                                Expiry Date
                       
                            </label>
                            <asp:TextBox ID="txtExpiryDate" runat="server"
                                CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                                placeholder="Enter Month/Year   -   e.g 06/27" />
                        </div>
                    </div>

                    <!-- Save Button -->
                    <div class="text-center mt-8">
                        <asp:Button ID="btnSave" runat="server"
                            Text="Save Details"
                            OnClick="btnSave_Click"                            
                            CssClass="checkout-pulse dark:bg-green-600 dark:text-slate-50 bg-green-600 text-slate-50 inline-flex items-center px-8 py-4 bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl focus:outline-none focus:ring-4 focus:ring-orange-300 dark:focus:ring-orange-800" />
                    </div>

                    <!-- Checkout Button -->
                    <div class="text-center mt-8">
                        <asp:Button ID="btnCheckout" runat="server"
                            Text="Proceed to Checkout"
                            OnClick="btnCheckout_Click"
                            CssClass="checkout-pulse dark:bg-orange-600 dark:text-slate-50 bg-orange-600 text-slate-50 inline-flex items-center px-8 py-4 bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl focus:outline-none focus:ring-4 focus:ring-orange-300 dark:focus:ring-orange-800" />

                    </div>


                    <!-- Message Display -->
                    <div class="mt-6 text-center">
                        <h2 id="lblMessage" runat="server" class="text-lg font-medium text-gray-900 dark:text-white"></h2>
                    </div>
                </div>

                <!-- Security & Trust Indicators -->
                <div class="mt-8 text-center">
                    <div class="flex flex-wrap justify-center gap-6">
                        <div class="flex items-center space-x-2 text-gray-600 dark:text-gray-400">
                            <svg class="w-5 h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                            </svg>
                            <span class="text-sm">SSL Encrypted</span>
                        </div>
                        <div class="flex items-center space-x-2 text-gray-600 dark:text-gray-400">
                            <svg class="w-5 h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" />
                            </svg>
                            <span class="text-sm">Secure Payment</span>
                        </div>
                        <div class="flex items-center space-x-2 text-gray-600 dark:text-gray-400">
                            <svg class="w-5 h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                            </svg>
                            <span class="text-sm">30-Day Returns</span>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Add smooth animations to cart items
            const cartItems = document.querySelectorAll('.cart-item-card');
            cartItems.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateY(20px)';

                setTimeout(() => {
                    item.style.transition = 'all 0.6s ease';
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }, index * 100);
            });

            // Copy cart total to final total if needed
            const cartTotal = document.querySelector('[id*="lblCartTotal"]');
            const finalTotal = document.querySelector('[id*="lblFinalTotal"]');
            if (cartTotal && finalTotal && !finalTotal.textContent.trim()) {
                finalTotal.textContent = cartTotal.textContent;
            }

            // Show empty cart message if no items
            if (cartItems.length === 0) {
                document.getElementById('emptyCart').classList.remove('hidden');
            }
        });
    </script>
</asp:Content>
