<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_report2.aspx.cs" Inherits="OffTheGrit1.admin_report2" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Admin - Sales Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .report-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .report-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .metric-card {
            transition: all 0.3s ease;
        }
        .metric-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }
        .dark .metric-card:hover {
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3);
        }
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }
        .progress-bar {
            height: 8px;
            border-radius: 4px;
            overflow: hidden;
        }
        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, hsl(39, 100%, 50%), hsl(39, 100%, 60%));
            border-radius: 4px;
            transition: width 2s ease-in-out;
        }
        .metric-animation {
            animation: countUp 2s ease-out;
        }
        @keyframes countUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .status-badge {
            animation: pulse 2s infinite;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Admin Sales Report Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <!-- Header -->
            <div class="text-center mb-12">
                <div class="flex items-center justify-center mb-4">
                    <div class="w-12 h-12 bg-orange-500 rounded-full flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                        </svg>
                    </div>
                    <h1 class="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white">
                        Sales <span class="text-orange-500">Analytics</span>
                    </h1>
                </div>
                <p class="text-lg text-gray-600 dark:text-gray-300">
                    Comprehensive sales performance dashboard for OFF THE GRID
                </p>
                <div class="w-24 h-1 bg-orange-500 mx-auto rounded-full mt-4"></div>
            </div>

            <!-- Alert Message -->
            <div id="messageContainer" class="mb-8">
                <asp:Label ID="lblMessage" runat="server" CssClass="block" />
            </div>

            <!-- Key Metrics Dashboard -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                
                <!-- Total Orders -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-blue-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Orders</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                <asp:Label ID="lblTotalOrders" runat="server" Text="0" />
                            </p>
                            <p class="text-sm text-green-600 dark:text-green-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                +12% from last month
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-blue-100 dark:bg-blue-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Total Revenue -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-green-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Revenue</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                R<asp:Label ID="lblTotalRevenue" runat="server" Text="0.00" />
                            </p>
                            <p class="text-sm text-green-600 dark:text-green-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                +8.3% from last month
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-green-100 dark:bg-green-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Pending Orders -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-orange-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Pending Orders</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                <asp:Label ID="lblPendingOrders" runat="server" Text="0" />
                            </p>
                            <p class="text-sm text-orange-600 dark:text-orange-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                                Needs attention
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-orange-100 dark:bg-orange-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Average Order Value -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-purple-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Average Order</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                R1,847
                            </p>
                            <p class="text-sm text-green-600 dark:text-green-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                +15.2% improvement
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-purple-100 dark:bg-purple-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"/>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts and Analytics Row -->
            <div class="grid lg:grid-cols-2 gap-8 mb-8">
                
                <!-- Sales Trend Chart -->
                <div class="report-gradient rounded-2xl shadow-xl p-8">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                        </svg>
                        Sales Trend (30 Days)
                    </h3>
                    <div class="chart-container">
                        <canvas id="salesChart" class="w-full h-full"></canvas>
                    </div>
                </div>

                <!-- Category Performance -->
                <div class="report-gradient rounded-2xl shadow-xl p-8">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"/>
                        </svg>
                        Category Performance
                    </h3>
                    <div class="space-y-4">
                        <div>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Solar Solutions</span>
                                <span class="text-sm font-bold text-gray-900 dark:text-white">45%</span>
                            </div>
                            <div class="progress-bar bg-gray-200 dark:bg-gray-700">
                                <div class="progress-fill" style="width: 45%"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Water Purification</span>
                                <span class="text-sm font-bold text-gray-900 dark:text-white">30%</span>
                            </div>
                            <div class="progress-bar bg-gray-200 dark:bg-gray-700">
                                <div class="progress-fill bg-blue-500" style="width: 30%"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Security Systems</span>
                                <span class="text-sm font-bold text-gray-900 dark:text-white">25%</span>
                            </div>
                            <div class="progress-bar bg-gray-200 dark:bg-gray-700">
                                <div class="progress-fill bg-green-500" style="width: 25%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Top Selling Products Table -->
            <div class="report-gradient rounded-2xl shadow-xl p-8">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                        </svg>
                        Top-Selling Products
                    </h3>
                    <div class="flex items-center space-x-2">
                        <button class="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600">
                            This Week
                        </button>
                        <button class="px-3 py-1 text-xs font-medium bg-orange-500 text-white rounded-lg">
                            This Month
                        </button>
                        <button class="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600">
                            This Year
                        </button>
                    </div>
                </div>
                
                <div class="overflow-x-auto">
                    <asp:Repeater ID="rptTopProducts" runat="server">
                        <HeaderTemplate>
                            <table class="w-full bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg">
                                <thead class="bg-gradient-to-r from-orange-500 to-orange-600 text-white">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Rank</th>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Product Name</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Units Sold</th>
                                        <th class="px-6 py-4 text-right text-sm font-bold uppercase tracking-wider">Revenue</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Performance</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-200">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <span class="w-8 h-8 bg-orange-500 rounded-full flex items-center justify-center text-white text-sm font-bold">
                                            <%# Container.ItemIndex + 1 %>
                                        </span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-2 h-2 bg-orange-500 rounded-full mr-3"></div>
                                        <div>
                                            <p class="text-sm font-medium text-gray-900 dark:text-white"><%# Eval("Product_Name") %></p>
                                            <p class="text-xs text-gray-500 dark:text-gray-400">Product ID: <%# Eval("Product_Name").ToString().GetHashCode().ToString().Substring(0, 6) %></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200">
                                        <%# Eval("QuantitySold") %> units
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-right text-sm font-bold text-gray-900 dark:text-white">
                                    R<%# Eval("Revenue", "{0:F2}") %>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <div class="flex items-center justify-center">
                                        <div class="status-badge w-3 h-3 bg-green-500 rounded-full mr-2"></div>
                                        <span class="text-xs font-medium text-green-600 dark:text-green-400">Hot</span>
                                    </div>
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

            <!-- Quick Actions -->
            <div class="mt-8 grid md:grid-cols-4 gap-4">
                <button class="flex items-center justify-center px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Export Report
                </button>
                
                <button class="flex items-center justify-center px-6 py-3 bg-green-500 hover:bg-green-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                    </svg>
                    Refresh Data
                </button>
                
                <button class="flex items-center justify-center px-6 py-3 bg-purple-500 hover:bg-purple-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                    Schedule Report
                </button>
                
                <button class="flex items-center justify-center px-6 py-3 bg-orange-500 hover:bg-orange-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    Settings
                </button>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Sales Chart
            const ctx = document.getElementById('salesChart').getContext('2d');
            const salesChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                        label: 'Sales Revenue (R)',
                        data: [12000, 19000, 15000, 25000, 22000, 30000, 28000, 35000, 32000, 40000, 38000, 45000],
                        borderColor: 'hsl(39, 100%, 50%)',
                        backgroundColor: 'hsl(39, 100%, 50%, 0.1)',
                        borderWidth: 3,
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                color: 'rgba(0,0,0,0.1)'
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    }
                }
            });

            // Animate progress bars
            setTimeout(() => {
                const progressBars = document.querySelectorAll('.progress-fill');
                progressBars.forEach(bar => {
                    const width = bar.style.width;
                    bar.style.width = '0%';
                    setTimeout(() => {
                        bar.style.width = width;
                    }, 100);
                });
            }, 500);

            // Animate metric cards
            const metricCards = document.querySelectorAll('.metric-card');
            metricCards.forEach((card, index) => {
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
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Admin - Sales Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .report-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .report-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .metric-card {
            transition: all 0.3s ease;
        }
        .metric-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }
        .dark .metric-card:hover {
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3);
        }
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }
        .progress-bar {
            height: 8px;
            border-radius: 4px;
            overflow: hidden;
        }
        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, hsl(39, 100%, 50%), hsl(39, 100%, 60%));
            border-radius: 4px;
            transition: width 2s ease-in-out;
        }
        .metric-animation {
            animation: countUp 2s ease-out;
        }
        @keyframes countUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .status-badge {
            animation: pulse 2s infinite;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Admin Sales Report Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <!-- Header -->
            <div class="text-center mb-12">
                <div class="flex items-center justify-center mb-4">
                    <div class="w-12 h-12 bg-orange-500 rounded-full flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                        </svg>
                    </div>
                    <h1 class="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white">
                        Sales <span class="text-orange-500">Analytics</span>
                    </h1>
                </div>
                <p class="text-lg text-gray-600 dark:text-gray-300">
                    Comprehensive sales performance dashboard for OFF THE GRID
                </p>
                <div class="w-24 h-1 bg-orange-500 mx-auto rounded-full mt-4"></div>
            </div>

            <!-- Alert Message -->
            <div id="messageContainer" class="mb-8">
                <asp:Label ID="lblMessage" runat="server" CssClass="block" />
            </div>

            <!-- Key Metrics Dashboard -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                
                <!-- Total Orders -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-blue-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Orders</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                <asp:Label ID="lblTotalOrders" runat="server" Text="0" />
                            </p>
                            <p class="text-sm text-green-600 dark:text-green-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                +12% from last month
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-blue-100 dark:bg-blue-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Total Revenue -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-green-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Revenue</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                <asp:Label ID="lblTotalRevenue" runat="server" Text="0.00" />
                            </p>
                            <p class="text-sm text-green-600 dark:text-green-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                +8.3% from last month
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-green-100 dark:bg-green-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Pending Orders -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-orange-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Pending Orders</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation">
                                <asp:Label ID="lblPendingOrders" runat="server" Text="0" />
                            </p>
                            <p class="text-sm text-orange-600 dark:text-orange-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                                Needs attention
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-orange-100 dark:bg-orange-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Average Order Value -->
                <div class="metric-card bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg border-l-4 border-purple-500">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Average Order</p>
                            <p class="text-3xl font-bold text-gray-900 dark:text-white metric-animation" id="lblAveOrder" runat="server">
                                R1,847
                            </p>
                            <p class="text-sm text-green-600 dark:text-green-400 flex items-center mt-2">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                </svg>
                                +15.2% improvement
                            </p>
                        </div>
                        <div class="w-16 h-16 bg-purple-100 dark:bg-purple-900/20 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"/>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts and Analytics Row -->
            <div class="grid lg:grid-cols-2 gap-8 mb-8">
                
                <!-- Sales Trend Chart -->
                <div class="report-gradient rounded-2xl shadow-xl p-8">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6 flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                        </svg>
                        Sales Trend (30 Days)
                    </h3>
                    <div class="chart-container">
                        <canvas id="salesChart" class="w-full h-full"></canvas>
                    </div>
                </div>

                <!-- KPIs and Product List Section -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Registered Users Today Card -->
                    <div class="bg-gradient-to-r from-orange-400 to-orange-600 rounded-2xl shadow-xl p-8 flex items-center justify-between">
                        <div>
                            <h3 class="text-xl text-slate-800 dark:text-slate-50 font-bold mb-2 flex items-center">
                                <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M5.121 17.804A9 9 0 1118.804 5.12M12 8v4l3 3" />
                                </svg>
                                Registered Users Today
                            </h3>
                            <span class="text-3xl text-slate-800 dark:text-slate-50 font-extrabold">
                                <asp:Label ID="UsersTodayLiteral" runat="server"></asp:Label>
                            </span>
                        </div>
                    </div>

                    <%--<!-- Product List Component -->
                    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-6">
                        <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                            <svg class="w-6 h-6 mr-2 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 7h18M3 12h18M3 17h18" />
                            </svg>
                            Products
                        </h3>
                        <div class="space-y-3">
                            <asp:Repeater ID="rptProducts" runat="server">
                                <ItemTemplate>
                                    <div class="flex justify-between items-center p-3 bg-gray-100 dark:bg-gray-700 rounded-lg">
                                        <span class="text-sm font-medium text-gray-700 dark:text-gray-300">
                                                <%# Eval("Product_Name") %>
                                        </span>
                                        <span class="text-sm font-bold text-gray-900 dark:text-white">
                                                 <%# Eval("Product_Quantity") %>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>--%>
                    <!-- Product List Component -->
                    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-6">
                        <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-4 flex items-center">
                            <svg class="w-6 h-6 mr-2 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 7h18M3 12h18M3 17h18" />
                            </svg>
                            Products
                        </h3>

                        <!-- Scrollable Container -->
                        <div class="space-y-3 max-h-64 overflow-y-auto pr-2">
                            <asp:Repeater ID="rptProducts" runat="server">
                                <ItemTemplate>
                                    <div class="flex justify-between items-center p-3 bg-gray-100 dark:bg-gray-700 rounded-lg">
                                        <span class="text-sm font-medium text-gray-700 dark:text-gray-300">
                                            <%# Eval("Product_Name") %>
                                        </span>
                                        <span class="text-sm font-bold text-gray-900 dark:text-white">
                                            <%# Eval("Product_Quantity") %>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>


                </div>


            </div>
            <div>
               


            <!-- Top Selling Products Table -->
            <div class="report-gradient rounded-2xl shadow-xl p-8">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-xl font-bold text-gray-900 dark:text-white flex items-center">
                        <svg class="w-6 h-6 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                        </svg>
                        Top-Selling Products
                    </h3>
                    <div class="flex items-center space-x-2">
                        <asp:Button CssClass="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600" id="btnThisWeek" runat="server" Text="This Week" OnClick="btnThisWeek_Click"></asp:Button>

                        <%--<button class="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600" id="btnThisWeek" runat="server">
                            This Week
                        </button>--%>

                       <%-- <button class="px-3 py-1 text-xs font-medium bg-orange-500 text-white rounded-lg" id="btnThisMonth" runat="server">
                            This Month
                        </button>--%>

                        <asp:Button CssClass="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600" id="btnThisMonth" runat="server" Text="This Month" OnClick="btnThisMonth_Click"></asp:Button>

                        <%--<button class="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600" id="btnThisYear" runat="server">
                            This Year
                        </button>--%>

                        <asp:Button CssClass="px-3 py-1 text-xs font-medium bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600" id="btnThisYear" runat="server" Text="This Year" OnClick="btnThisYear_Click"></asp:Button>

                    </div>
                </div>
                
                <div class="overflow-x-auto">
                    <asp:Repeater ID="rptTopProducts" runat="server">
                        <HeaderTemplate>
                            <table class="w-full bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg">
                                <thead class="bg-gradient-to-r from-orange-500 to-orange-600 text-white">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Rank</th>
                                        <th class="px-6 py-4 text-left text-sm font-bold uppercase tracking-wider">Product Name</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Units Sold</th>
                                        <th class="px-6 py-4 text-right text-sm font-bold uppercase tracking-wider">Revenue</th>
                                        <th class="px-6 py-4 text-center text-sm font-bold uppercase tracking-wider">Performance</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors duration-200">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <span class="w-8 h-8 bg-orange-500 rounded-full flex items-center justify-center text-white text-sm font-bold">
                                            <%# Container.ItemIndex + 1 %>
                                        </span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-2 h-2 bg-orange-500 rounded-full mr-3"></div>
                                        <div>
                                            <p class="text-sm font-medium text-gray-900 dark:text-white"><%# Eval("Product_Name") %></p>
                                            <p class="text-xs text-gray-500 dark:text-gray-400">Product ID: <%# Eval("Product_Name").ToString().GetHashCode().ToString().Substring(0, 6) %></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200">
                                        <%# Eval("QuantitySold") %> units
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-right text-sm font-bold text-gray-900 dark:text-white">
                                    R<%# Eval("Revenue", "{0:F2}") %></td>
                                <td class="px-6 py-4 text-center">
                                    <div class="flex items-center justify-center">
                                        <div class="status-badge w-3 h-3 bg-green-500 rounded-full mr-2"></div>
                                        <span class="text-xs font-medium text-green-600 dark:text-green-400">Hot</span>
                                    </div>
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

            <!-- Quick Actions -->
            <div class="mt-8 grid md:grid-cols-4 gap-4">
                <button class="flex items-center justify-center px-6 py-3 bg-blue-500 hover:bg-blue-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Export Report
                </button>
                
                <button class="flex items-center justify-center px-6 py-3 bg-green-500 hover:bg-green-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                    </svg>
                    Refresh Data
                </button>
                
                <%--<button class="flex items-center justify-center px-6 py-3 bg-purple-500 hover:bg-purple-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                    Schedule Report
                </button>
                
                <button class="flex items-center justify-center px-6 py-3 bg-orange-500 hover:bg-orange-600 text-white rounded-xl font-semibold transition-all duration-300 transform hover:scale-105">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    Settings
                </button>--%>
            </div>
             </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Use server-side JSON variables injected into page
        const salesLabels = <%= SalesLabelsJson %>;   // e.g. ["Sep 2024", "Oct 2024", ...]
    const salesValues = <%= SalesValuesJson %>;   // e.g. [12000.0, 19000.0, ...]

        // Sales Chart
        const ctx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: salesLabels,
                datasets: [{
                    label: 'Sales Revenue (R)',
                    data: salesValues,
                    borderColor: 'hsl(39, 100%, 50%)',
                    backgroundColor: 'rgba(255, 165, 0, 0.12)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: { color: 'rgba(0,0,0,0.1)' }
                    },
                    x: { grid: { display: false } }
                }
            }
        });

        // (rest of your animations)
    });
</script>

</asp:Content>
