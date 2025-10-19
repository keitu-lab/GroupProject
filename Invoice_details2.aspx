<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Invoice_details2.aspx.cs" Inherits="OffTheGrit1.Invoice_details2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Invoice Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .invoice-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .invoice-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .header-gradient {
            background: linear-gradient(135deg, hsl(39, 100%, 50%), hsl(39, 100%, 45%));
        }
        .print-button {
            transition: all 0.3s ease;
        }
        .print-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        .dark .print-button:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        @media print {
            .no-print {
                display: none !important;
            }
            .invoice-container {
                box-shadow: none !important;
                border: 1px solid #ddd !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Invoice Details Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <!-- Header -->
            <div class="text-center mb-8 no-print">
                <h1 class="text-3xl md:text-4xl font-bold text-gray-900 dark:text-white mb-4">
                    <span class="text-orange-500">Invoice</span> Details
                </h1>
                <div class="w-20 h-1 bg-orange-500 mx-auto rounded-full"></div>
            </div>

            <!-- Invoice Container -->
            <div class="invoice-gradient invoice-container rounded-2xl shadow-2xl overflow-hidden">
                
                <!-- Invoice Header -->
                <div class="header-gradient p-8 text-white">
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                        <div>
                            <h2 id="lblHeader" class="text-2xl md:text-3xl font-bold mb-2">Invoice Details</h2>
                            <p class="text-orange-100">OFF THE GRID Solutions</p>
                        </div>
                        <div class="mt-4 md:mt-0 text-right">
                            <div class="flex items-center space-x-2 mb-2">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                                <span class="font-semibold">INVOICE</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Invoice Content -->
                <div class="p-8">
                    
                    <!-- Invoice Information Grid -->
                    <div class="grid md:grid-cols-3 gap-6 mb-8">
                        
                        <!-- Invoice ID -->
                        <div class="bg-white dark:bg-gray-800 p-4 rounded-xl shadow-md">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 bg-blue-500 rounded-lg flex items-center justify-center">
                                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                                    </svg>
                                </div>
                                <div>
                                    <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Invoice ID</p>
                                    <p class="text-lg font-bold text-gray-900 dark:text-white">
                                        <asp:Label ID="lblInvoiceId" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Date -->
                        <div class="bg-white dark:bg-gray-800 p-4 rounded-xl shadow-md">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 bg-green-500 rounded-lg flex items-center justify-center">
                                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                    </svg>
                                </div>
                                <div>
                                    <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Invoice Date</p>
                                    <p class="text-lg font-bold text-gray-900 dark:text-white">
                                        <asp:Label ID="lblInvoiceDate" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Customer -->
                        <div class="bg-white dark:bg-gray-800 p-4 rounded-xl shadow-md">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 bg-purple-500 rounded-lg flex items-center justify-center">
                                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                                    </svg>
                                </div>
                                <div>
                                    <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Customer</p>
                                    <p class="text-lg font-bold text-gray-900 dark:text-white">
                                        <asp:Label ID="lblCustomerName" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Line Items Table -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"/>
                            </svg>
                            Order Items
                        </h3>
                        
                        <div class="overflow-x-auto">
                            <asp:Repeater ID="rptInvoiceLines" runat="server">
                                <HeaderTemplate>
                                    <table class="w-full bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg">
                                        <thead class="header-gradient text-white">
                                            <tr>
                                                <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Product</th>
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
                                                <span class="text-sm font-medium text-gray-900 dark:text-white"><%# Eval("Product_Name") %></span>
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
                                           <%# Eval("Subtotal") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                        </tbody>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Totals Section -->
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-end">
                        <div class="mb-6 md:mb-0">
                            <h4 class="text-lg font-bold text-gray-900 dark:text-white mb-3">Payment Information</h4>
                            <div class="bg-blue-50 dark:bg-blue-900/20 p-4 rounded-xl border border-blue-200 dark:border-blue-800">
                                <div class="flex items-center text-blue-700 dark:text-blue-300">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"/>
                                    </svg>
                                    <span class="text-sm font-medium">Payment processed securely</span>
                                </div>
                            </div>
                        </div>

                        <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg min-w-80">
                            <h4 class="text-lg font-bold text-gray-900 dark:text-white mb-4">Order Summary</h4>
                            
                            <div class="space-y-3">
                                <div class="flex justify-between items-center py-2 border-b border-gray-200 dark:border-gray-700">
                                    <span class="text-gray-600 dark:text-gray-400">Subtotal:</span>
                                    <span class="font-medium text-gray-900 dark:text-white">
                                        R<asp:Label ID="lblSubtotal" runat="server" />
                                    </span>
                                </div>
                                
                                <div class="flex justify-between items-center py-2 border-b border-gray-200 dark:border-gray-700">
                                    <span class="text-gray-600 dark:text-gray-400">Shipping:</span>
                                    <span class="font-medium text-gray-900 dark:text-white">
                                        <asp:Label ID="lblShipping" runat="server" CssClass="font-medium text-green-600 dark:text-green-400" />
                                    </span>
                                </div>
                                
                                <div class="flex justify-between items-center py-3 bg-orange-50 dark:bg-orange-900/20 rounded-lg px-4 border-2 border-orange-200 dark:border-orange-800">
                                    <span class="text-lg font-bold text-orange-700 dark:text-orange-300">Total:</span>
                                    <span class="text-xl font-bold text-orange-700 dark:text-orange-300">
                                        R<asp:Label ID="lblTotal" runat="server" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex flex-col sm:flex-row gap-4 mt-8 pt-8 border-t border-gray-200 dark:border-gray-700 no-print">
                        <a href="invoice_history2.aspx" 
                           class="flex items-center justify-center px-6 py-3 bg-gray-600 hover:bg-gray-700 dark:bg-gray-700 dark:hover:bg-gray-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                            </svg>
                            Back to Invoice History
                        </a>
                        
                        <button onclick="window.print()" 
                                class="print-button flex items-center justify-center px-6 py-3 bg-orange-500 hover:bg-orange-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"/>
                            </svg>
                            Print Invoice
                        </button>

                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        

        // Add smooth animations when page loads
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.invoice-container > div');
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