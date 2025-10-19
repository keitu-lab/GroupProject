<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OffTheGrit1.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Register - OFF THE GRID
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-gradient {
            background-color: #F8FAFC;
        }
/*        .dark .login-gradient {
             background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }*/
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
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.15);
        }
        .dark .input-focus:focus {
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.3);
        }
        .login-animation {
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
        .pulse-animation {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Register Section -->
    <section class="min-h-screen login-gradient dark:bg-gray-900 flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-lg w-full">
            
            <!-- Register Card -->
            <div class="login-animation form-gradient rounded-2xl shadow-2xl p-8 md:p-10">
                
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="flex items-center justify-center mb-6">
                        <div class="pulse-animation w-16 h-16 bg-white border border-orange-500 rounded-full flex items-center justify-center">
                            <img src="./images/OTG-logo-orange.png" width="45" alt="" />
                        </div>
                    </div>
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-2">Create Your Account</h1>
                    <p class="text-gray-600 dark:text-gray-300">Join OFF THE GRID today</p>
                </div>

                <!-- Status Message -->
                <div class="mb-6">
                    <asp:Label ID="lblStatus" runat="server"
                        CssClass="block text-sm font-medium p-3 rounded-lg text-center" />
                </div>

                <!-- Registration Form -->
                <div class="space-y-6">
                    <!-- Name -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Name
                        </label>
                        <asp:TextBox ID="txtName" runat="server"
                            CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                            placeholder="Enter your first name" />
                    </div>

                    <!-- Surname -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Surname
                        </label>
                        <asp:TextBox ID="txtSurname" runat="server"
                            CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                            placeholder="Enter your surname" />
                    </div>

                    <!-- Mobile -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Mobile
                        </label>
                        <asp:TextBox ID="txtMobile" runat="server"
                            CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                            placeholder="Enter your mobile number" />
                    </div>

                    <!-- Email -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Email Address
                        </label>
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                            placeholder="Enter your email address"
                            TextMode="Email" />
                    </div>

                    <!-- Password -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Password
                        </label>
                        <asp:TextBox ID="txtPassword" runat="server"
                            CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                            placeholder="Create a password"
                            TextMode="Password" />
                    </div>

                    <!-- Confirm Password -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Confirm Password
                        </label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server"
                            CssClass="input-focus w-full px-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
                            placeholder="Confirm your password"
                            TextMode="Password" />
                    </div>

                    <!-- Register Button -->
                    <div>
                        <asp:Button ID="btnRegister" runat="server"
                            Text="Sign Up"
                            OnClick="btnRegister_Click"
                            CssClass="w-full dark:bg-orange-500 bg-orange-500 text-white-500 dark:text-white-500 hover:text-white bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white py-4 px-6 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl focus:outline-none focus:ring-4 focus:ring-orange-300 dark:focus:ring-orange-800" />
                    </div>
                </div>

                <!-- Login Link -->
                <div class="mt-8 text-center">
                    <p class="text-gray-600 dark:text-gray-300">
                        Already have an account?
                        <a href="Login.aspx" class="font-semibold text-orange-500 hover:text-orange-600 transition-colors duration-300">
                            Sign in
                        </a>
                    </p>
                </div>

            </div>
        </div>
    </section>
</asp:Content>

