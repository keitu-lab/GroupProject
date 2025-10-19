<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_products.aspx.cs" Inherits="OffTheGrit1.add_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Add Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .form-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .input-focus {
            transition: all 0.3s ease;
        }
        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        .dark .input-focus:focus {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Add Products Section -->
    <section class="min-h-screen bg-gray-50 dark:bg-gray-900 py-12">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <!-- Header -->
            <div class="text-center mb-12">
                <h1 class="text-4xl md:text-5xl font-bold text-gray-900 dark:text-white mb-4">
                    Add <span class="text-orange-500">Product</span>
                </h1>
                <p class="text-lg text-gray-600 dark:text-gray-300">
                    Add new products to your OFF THE GRID catalog
                </p>
                <div class="w-24 h-1 bg-orange-500 mx-auto rounded-full mt-4"></div>
            </div>

            <!-- Form Container -->
            <div class="form-gradient rounded-2xl shadow-2xl p-8 md:p-12">
                
                <!-- Form Header -->
                <div class="mb-8">
                    <div class="flex items-center justify-center mb-6">
                        <div class="w-16 h-16 bg-orange-500 rounded-full flex items-center justify-center">
                            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                            </svg>
                        </div>
                    </div>
                    <h2 class="text-2xl font-bold text-center text-gray-900 dark:text-white">
                        Product Information
                    </h2>
                    <p class="text-center text-gray-600 dark:text-gray-300 mt-2">
                        Fill in the details below to add a new product
                    </p>
                </div>

                <!-- Form Fields -->
                <div class="space-y-6">
                    
                   
                  
                    <!-- Product Name -->
                    <div class="group">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Product Name *
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                                </svg>
                            </div>
                            <input 
                                class="name input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent" 
                                type="text" 
                                placeholder="Enter product name" 
                                id="txtName" runat="server"
                                required>
                        </div>
                    </div>

                    <!-- Image URL -->
                    <div class="group">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Image URL *
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                            </div>
                             <input 
                                class="name input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent" 
                                type="text" 
                                placeholder="Enter product name" 
                                id="txtImage" runat="server"
                                required>
                        </div>
                    </div>

                    <!-- Price -->
                    <div class="group">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Price (ZAR) *
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1"/>
                                </svg>
                            </div>
                            <input 
                                class="Mobile input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent" 
                                type="text" 
                                placeholder="0.00" 
                                step="0.01"
                                min="0"
                                id="txtPrice" runat="server"
                                required>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="group">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Product Description *
                        </label>
                        <div class="relative">
                            <div class="absolute top-3 left-0 pl-3 flex items-start pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                            </div>
                            <textarea 
                                class="Email input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent resize-none h-32" 
                                placeholder="Enter detailed product description..."
                                id="txtDescription" runat="server"
                                required></textarea>
                        </div>
                    </div>

                    <!-- Quantity -->
                    <div class="group">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Quantity in Stock *
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4V2a1 1 0 011-1h8a1 1 0 011 1v2m-9 0h10m-9 0V6a1 1 0 001 1h8a1 1 0 001-1V4M7 10h10M7 14h10M7 18h10"/>
                                </svg>
                            </div>
                            <input 
                                class="quantity-input input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent" 
                                type="number" 
                                placeholder="0" 
                                min="0" 
                                id="txtQuantity" runat="server"
                                required>
                        </div>
                    </div>

                    <!-- Category Selection -->
                    <div class="group">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Product Category *
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"/>
                                </svg>
                            </div>
                            <select id="txtCategory" runat="server" class="w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent">
                                <option value="">Select Category</option>
                                <option value="1">Solar Solutions</option>
                                <option value="2">Water Purification</option>
                                <option value="3">Security Systems</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="mt-10">
                    <asp:Button ID="btnAddProduct" runat="server" 
                        Text="Add Product" 
                        CssClass="w-full bg-gradient-to-r dark:bg-orange-600 bg-orange-600 dark:text-slate-50 text-slate-950 from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white py-4 px-6 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl focus:outline-none focus:ring-4 focus:ring-orange-300 dark:focus:ring-orange-800" OnClick="btnAddProduct_Click" />
                </div>

                <!-- Status Label -->
                <div class="mt-6 text-center">
                    <asp:Label ID="lblStatus" runat="server" 
                        CssClass="text-sm font-medium text-gray-600 dark:text-gray-300 p-4 rounded-lg bg-gray-100 dark:bg-gray-800"
                        Text="" Visible="false"></asp:Label>
                </div>

                <!-- Additional Info -->
                <div class="mt-8 p-6 bg-blue-50 dark:bg-blue-900/20 rounded-xl border border-blue-200 dark:border-blue-800">
                    <div class="flex items-start">
                        <svg class="w-6 h-6 text-blue-500 mt-1 mr-3 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        <div>
                            <h4 class="font-semibold text-blue-800 dark:text-blue-300 mb-2">Product Guidelines</h4>
                            <ul class="text-sm text-blue-700 dark:text-blue-400 space-y-1">
                                <li>• Ensure all product information is accurate and complete</li>
                                <li>• Use high-quality images</li>
                                <li>• Write clear, detailed descriptions for better customer understanding</li>
                                <li>• Double-check pricing and stock quantities before submitting</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Add smooth animations to form inputs
            const inputs = document.querySelectorAll('input, textarea, select');

            inputs.forEach(input => {
                input.addEventListener('focus', function () {
                    this.parentElement.classList.add('scale-105');
                });

                input.addEventListener('blur', function () {
                    this.parentElement.classList.remove('scale-105');
                });
            });

            // Form validation feedback
            const form = document.querySelector('form');
            if (form) {
                form.addEventListener('submit', function (e) {
                    const requiredFields = document.querySelectorAll('[required]');
                    let allValid = true;

                    requiredFields.forEach(field => {
                        if (!field.value.trim()) {
                            field.classList.add('border-red-500', 'ring-red-500');
                            field.classList.remove('border-gray-300', 'dark:border-gray-600');
                            allValid = false;
                        } else {
                            field.classList.remove('border-red-500', 'ring-red-500');
                            field.classList.add('border-green-500', 'ring-green-500');
                        }
                    });

                    if (!allValid) {
                        e.preventDefault();
                        // Show error message
                        const statusLabel = document.querySelector('[id*="lblStatus"]');
                        if (statusLabel) {
                            statusLabel.textContent = 'Please fill in all required fields';
                            statusLabel.className = 'text-sm font-medium text-red-600 dark:text-red-400 p-4 rounded-lg bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800';
                        }
                    }
                });
            }
        });
    </script>
</asp:Content>
