<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_orders2.aspx.cs" Inherits="OffTheGrit1.admin_orders2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Admin - View Orders
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .orders-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .orders-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .header-gradient {
            background: linear-gradient(135deg, hsl(39, 100%, 50%), hsl(39, 100%, 45%));
        }
        .order-row {
            transition: all 0.3s ease;
        }
        .order-row:hover {
            transform: translateX(4px);
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.2);
        }
        .dark .order-row:hover {
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.3);
        }
        .slide-in {
            animation: slideInUp 0.8s ease-out;
        }
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .status-badge {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.8;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Admin Orders Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <!-- Header -->
            <div class="text-center mb-12">
                <div class="flex items-center justify-center mb-4">
                    <div class="w-12 h-12 bg-orange-500 rounded-full flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/>
                        </svg>
                    </div>
                    <h1 class="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white">
                        Orders <span class="text-orange-500">Management</span>
                    </h1>
                </div>
                <p class="text-lg text-gray-600 dark:text-gray-300">
                    Monitor and manage all customer orders
                </p>
                <div class="w-24 h-1 bg-orange-500 mx-auto rounded-full mt-4"></div>
            </div>

            <!-- Alert Message -->
            <div class="mb-8">
                <asp:Label ID="lblMessage" runat="server" CssClass="block text-center" />
            </div>

            <!-- Statistics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                
                <!-- Total Orders -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-blue-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Orders</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white" id="lblTotalOrders" runat="server">156</p>
                        </div>
                        <div class="w-12 h-12 bg-blue-100 dark:bg-blue-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Pending Orders -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-orange-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Pending</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white" id="lblPendingOrders" runat="server">23</p>
                        </div>
                        <div class="w-12 h-12 bg-orange-100 dark:bg-orange-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Delivered Orders -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-green-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Delivered</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white" id="lblDeliveredOrders" runat="server">128</p>
                        </div>
                        <div class="w-12 h-12 bg-green-100 dark:bg-green-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Processing Orders -->
                <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-purple-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Processing</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white" id="lblProcessingOrders" runat="server">5</p>
                        </div>
                        <div class="w-12 h-12 bg-purple-100 dark:bg-purple-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Orders Table -->
            <div class="slide-in orders-gradient rounded-2xl shadow-2xl p-8">
                
                <!-- Table Header -->
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                        </svg>
                        All Orders
                    </h2>
                    
                    <!-- Filter & Search -->
                    <div class="flex items-center space-x-4">
                        <div class="relative">
                            <input type="text" id="searchOrders" placeholder="Search orders..." 
                                   class="pl-10 pr-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500">
                            <svg class="w-5 h-5 absolute left-3 top-2.5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                            </svg>
                        </div>
                        
                        <select class="px-4 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500">
                            <option>All Status</option>
                            <option>Pending</option>
                            <option>Processing</option>
                            <option>Delivered</option>
                        </select>
                    </div>
                </div>

                <!-- Orders Table -->
                <div class="overflow-x-auto">
                    <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand">
                        <HeaderTemplate>
                            <table class="w-full bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg">
                                <thead class="header-gradient text-white">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Order #</th>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Customer ID</th>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Invoice ID</th>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Order Date</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Status</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="order-row hover:bg-gray-50 dark:hover:bg-gray-700 transition-all duration-200">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-2 h-2 bg-orange-500 rounded-full mr-3"></div>
                                        <span class="text-sm font-bold text-gray-900 dark:text-white">#<%# Eval("Order_ID") %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <svg class="w-4 h-4 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                                        </svg>
                                        <span class="text-sm text-gray-900 dark:text-white"><%# Eval("Customer_ID") %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <svg class="w-4 h-4 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                        </svg>
                                        <span class="text-sm text-gray-900 dark:text-white"><%# Eval("Invoice_ID") %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <svg class="w-4 h-4 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                        </svg>
                                        <span class="text-sm text-gray-900 dark:text-white"><%# String.Format("{0:MMM dd, yyyy}", Eval("Order_Date")) %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <%# GetStatusBadge(Eval("Order_Delivery_Status").ToString()) %>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <asp:Button ID="btnViewDetails" runat="server"
                                        CommandName="ViewDetails"
                                        CommandArgument='<%# Eval("Order_ID") %>'
                                        Text="View Details"
                                        CssClass="inline-flex items-center px-4 py-2 bg-orange-500 hover:bg-orange-600 text-white rounded-lg font-semibold text-sm transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-orange-300" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <!-- Pagination -->
                <div class="mt-6 flex items-center justify-between">
                    <div class="text-sm text-gray-600 dark:text-gray-400" id="lblShoqingOrders" runat="server">
                        Showing 1 to 10 of 156 orders
                    </div>
                   <%-- <div class="flex space-x-2">
                        <button class="px-3 py-1 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600 transition-colors">
                            Previous
                        </button>
                        <button class="px-3 py-1 bg-orange-500 text-white rounded-lg font-semibold">1</button>
                        <button class="px-3 py-1 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600 transition-colors">2</button>
                        <button class="px-3 py-1 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600 transition-colors">3</button>
                        <button class="px-3 py-1 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600 transition-colors">
                            Next
                        </button>
                    </div>--%>
                </div>
            </div>

            <!-- Quick Actions -->
            <%--<div class="mt-8 grid md:grid-cols-3 gap-4">
                <button class="flex items-center justify-center px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Export Orders
                </button>--%>
                
                <button class="flex items-center justify-center px-6 py-3 bg-green-500 hover:bg-green-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                    </svg>
                    Refresh Data
                </button>
                
               <%-- <button class="flex items-center justify-center px-6 py-3 bg-purple-500 hover:bg-purple-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"/>
                    </svg>
                    Advanced Filters
                </button>--%>
            </div>
        </div>
    </section>

    <script>
        // Search functionality
        document.getElementById('searchOrders')?.addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('.order-row');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });

        // Add loading animations
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('.order-row');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateX(-20px)';
                
                setTimeout(() => {
                    row.style.transition = 'all 0.6s ease';
                    row.style.opacity = '1';
                    row.style.transform = 'translateX(0)';
                }, index * 50);
            });
        });
    </script>
</asp:Content>