<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="order_details2.aspx.cs" Inherits="OffTheGrit1.order_details2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Order Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .order-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .order-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .header-gradient {
            background: linear-gradient(135deg, hsl(39, 100%, 50%), hsl(39, 100%, 45%));
        }
        .status-processing {
            background: linear-gradient(135deg, hsl(45, 100%, 50%), hsl(45, 100%, 45%));
        }
        .status-shipped {
            background: linear-gradient(135deg, hsl(120, 60%, 50%), hsl(120, 60%, 45%));
        }
        .status-delivered {
            background: linear-gradient(135deg, hsl(150, 80%, 50%), hsl(150, 80%, 45%));
        }
        .status-cancelled {
            background: linear-gradient(135deg, hsl(0, 70%, 60%), hsl(0, 70%, 55%));
        }
        .order-card {
            transition: all 0.3s ease;
        }
        .order-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        .dark .order-card:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        .progress-step {
            position: relative;
        }
        .progress-step:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 50%;
            right: -50%;
            width: 100%;
            height: 2px;
            background: #e5e7eb;
            z-index: 1;
        }
        .progress-step.completed::after {
            background: hsl(39, 100%, 50%);
        }
        .dark .progress-step:not(:last-child)::after {
            background: #374151;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Order Details Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <!-- Header -->
            <div class="text-center mb-8">
                <h1 class="text-3xl md:text-4xl font-bold text-gray-900 dark:text-white mb-4">
                    Order <span class="text-orange-500">Details</span>
                </h1>
                <div class="w-20 h-1 bg-orange-500 mx-auto rounded-full"></div>
            </div>

            <!-- Order Summary Cards -->
            <div class="grid md:grid-cols-2 lg:grid-cols-5 gap-6 mb-8">
                
                <!-- Order ID -->
                <div class="order-card bg-white dark:bg-gray-800 p-4 rounded-xl shadow-lg">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-blue-500 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-xs font-medium text-gray-500 dark:text-gray-400">Order ID</p>
                            <p class="text-sm font-bold text-gray-900 dark:text-white">
                                <asp:Label ID="lblOrderId" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Invoice ID -->
                <div class="order-card bg-white dark:bg-gray-800 p-4 rounded-xl shadow-lg">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-green-500 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-xs font-medium text-gray-500 dark:text-gray-400">Invoice ID</p>
                            <p class="text-sm font-bold text-gray-900 dark:text-white">
                                <asp:Label ID="lblInvoiceId" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Customer ID -->
                <div class="order-card bg-white dark:bg-gray-800 p-4 rounded-xl shadow-lg">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-purple-500 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-xs font-medium text-gray-500 dark:text-gray-400">Customer ID</p>
                            <p class="text-sm font-bold text-gray-900 dark:text-white">
                                <asp:Label ID="lblCustomerId" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>

                <%--<!-- Status -->
                <div class="order-card bg-white dark:bg-gray-800 p-4 rounded-xl shadow-lg">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-orange-500 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-xs font-medium text-gray-500 dark:text-gray-400">Status</p>
                            <p class="text-sm font-bold text-gray-900 dark:text-white">
                                <asp:Label ID="lblStatus" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>--%>
                <!-- Status (with DropDownList) -->
                <div class="order-card bg-white dark:bg-gray-800 p-4 rounded-xl shadow-lg">
                    <div class="flex flex-col space-y-2">
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 bg-orange-500 rounded-lg flex items-center justify-center">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                            </div>
                            <div>
                                <p class="text-xs font-medium text-gray-500 dark:text-gray-400">Status</p>
                                <asp:Label ID="lblStatus" runat="server" CssClass="text-sm font-bold text-gray-900 dark:text-white" />
                            </div>
                        </div>

                        <!-- Dropdown to change status -->
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="mt-2 block w-full p-2 border border-gray-300 dark:border-slate-800 text-gray-900 bg-white dark:text-white dark:bg-slate-800 rounded-lg text-sm"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            <asp:ListItem Text="Processing" Value="Processing"></asp:ListItem>
                            <asp:ListItem Text="Shipped" Value="Shipped"></asp:ListItem>
                            <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                            <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>


                <!-- Date -->
                <div class="order-card bg-white dark:bg-gray-800 p-4 rounded-xl shadow-lg">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-indigo-500 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-xs font-medium text-gray-500 dark:text-gray-400">Order Date</p>
                            <p class="text-sm font-bold text-gray-900 dark:text-white">
                                <asp:Label ID="lblOrderDate" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Progress Timeline -->
           <%-- <div class="order-gradient rounded-2xl shadow-xl p-8 mb-8">
                <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6 flex items-center">
                    <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    Order Progress
                </h3>
                
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                    <div class="progress-step completed text-center">
                        <div class="w-12 h-12 bg-green-500 rounded-full flex items-center justify-center mx-auto mb-2 relative z-10">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                            </svg>
                        </div>
                        <p class="text-sm font-medium text-green-600 dark:text-green-400">Order Placed</p>
                        <p class="text-xs text-gray-500 dark:text-gray-400">Confirmed</p>
                    </div>
                    
                    <div class="progress-step completed text-center">
                        <div class="w-12 h-12 bg-orange-500 rounded-full flex items-center justify-center mx-auto mb-2 relative z-10">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <p class="text-sm font-medium text-orange-600 dark:text-orange-400">Processing</p>
                        <p class="text-xs text-gray-500 dark:text-gray-400">In Progress</p>
                    </div>
                    
                    <div class="progress-step text-center">
                        <div class="w-12 h-12 bg-gray-300 dark:bg-gray-600 rounded-full flex items-center justify-center mx-auto mb-2 relative z-10">
                            <svg class="w-6 h-6 text-gray-600 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                            </svg>
                        </div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Shipped</p>
                        <p class="text-xs text-gray-500 dark:text-gray-400">Pending</p>
                    </div>
                    
                    <div class="progress-step text-center">
                        <div class="w-12 h-12 bg-gray-300 dark:bg-gray-600 rounded-full flex items-center justify-center mx-auto mb-2 relative z-10">
                            <svg class="w-6 h-6 text-gray-600 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002-2h14a2 2 0 002 2H5a2 2 0 00-2-2z"/>
                            </svg>
                        </div>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Delivered</p>
                        <p class="text-xs text-gray-500 dark:text-gray-400">Pending</p>
                    </div>
                </div>
            </div>--%>

            <!-- Order Items Table -->
            <div class="order-gradient rounded-2xl shadow-xl p-8">
                <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6 flex items-center">
                    <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"/>
                    </svg>
                    Order Items
                </h3>
                
                <div class="overflow-x-auto">
                    <asp:Repeater ID="rptOrderLines" runat="server">
                        <HeaderTemplate>
                            <table class="w-full bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg">
                                <thead class="header-gradient text-white">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Product Name</th>
                                        <th class="px-6 py-4 text-right text-sm font-bold uppercase tracking-wider">Price</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Quantity</th>
                                        <th class="px-6 py-4 text-right text-sm font-bold uppercase tracking-wider">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-200">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-2 h-2 bg-orange-500 rounded-full mr-3"></div>
                                        <div>
                                            <p class="text-sm font-medium text-gray-900 dark:text-white"><%# Eval("Product_Name") %></p>
                                            <p class="text-xs text-gray-500 dark:text-gray-400">SKU: PRD-<%# Eval("Product_Name").ToString().GetHashCode().ToString().Substring(0, 6) %></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-right text-sm text-gray-900 dark:text-white font-medium">
                                    R<%# Eval("Product_Price", "{0:F2}") %>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200">
                                        <%# Eval("Quantity") %>
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-right text-sm font-bold text-gray-900 dark:text-white">
                                    R<%# Eval("Subtotal", "{0:F2}") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <!-- Order Actions -->
                <div class="flex flex-col sm:flex-row gap-4 mt-8 pt-8 border-t border-gray-200 dark:border-gray-700">
                    <a href="admin_orders2.aspx" 
                       class="flex items-center justify-center px-6 py-3 bg-gray-600 hover:bg-gray-700 dark:bg-gray-700 dark:hover:bg-gray-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                        </svg>
                        Back to Orders
                    </a>
                    
                    <%--<button class="flex items-center justify-center px-6 py-3 bg-orange-500 hover:bg-orange-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"/>
                        </svg>
                        Print Order
                    </button>

                    <button class="flex items-center justify-center px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 7.89a2 2 0 002.83 0L21.61 8.05a2 2 0 00-.45-3.11L20.16 4.5a2 2 0 00-1.76-.05L12 7.89 5.6 4.45a2 2 0 00-1.76.05L2.84 4.94A2 2 0 002.39 8z"/>
                        </svg>
                        Send Update
                    </button>

                    <button class="flex items-center justify-center px-6 py-3 bg-green-500 hover:bg-green-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        View Invoice
                    </button>--%>
                </div>
            </div>

            <!-- Additional Information -->
            <div class="mt-8 grid md:grid-cols-2 gap-6">
                <!-- Shipping Information -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg">
                    <h4 class="text-lg font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                        <svg class="w-5 h-5 mr-2 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                        </svg>
                        Shipping Details
                    </h4>
                    <div class="space-y-2 text-gray-600 dark:text-gray-300">
                        <p><span class="font-medium">Method:</span> Standard Delivery</p>
                        <p><span class="font-medium">Estimated:</span> 3-5 Business Days</p>
                        <p><span class="font-medium">Tracking:</span> Available after shipment</p>
                    </div>
                </div>

                <!-- Payment Information -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg">
                    <h4 class="text-lg font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                        <svg class="w-5 h-5 mr-2 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"/>
                        </svg>
                        Payment Status
                    </h4>
                    <div class="flex items-center space-x-2">
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200">
                            <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                            </svg>
                            Payment Confirmed
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add loading animation to cards
            const cards = document.querySelectorAll('.order-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'all 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
    </script>
</asp:Content>