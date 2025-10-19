<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="OffTheGrit1.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Homepage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        /*.hero-gradient {*/
            /*background: linear-gradient(135deg, hsl(220, 13%, 18%), hsl(220, 13%, 15%));*/
        /*}
        .dark .hero-gradient {*/
            /*background: linear-gradient(135deg, hsl(220, 13%, 8%), hsl(220, 13%, 5%));*/
        /*}*/
        .card-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .card-gradient {
           background: var(--color-gray-800);
        }
        .accent-gradient {
            background: linear-gradient(135deg, hsl(39, 100%, 50%), hsl(39, 100%, 45%));
        }
        .text-shadow {
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .image-slider {
            position: relative;
            overflow: hidden;
            border-radius: 1rem;
        }
        .image-slider ul {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }
        .image-slider li {
            min-width: 100%;
            list-style: none;
        }
        .image-slider-img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }
        .control_prev, .control_next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 1rem;
            border-radius: 50%;
            text-decoration: none;
            transition: all 0.3s ease;
            z-index: 10;
        }
        .control_prev {
            left: 1rem;
        }
        .control_next {
            right: 1rem;
        }
        .control_prev:hover, .control_next:hover {
            background: rgba(0, 0, 0, 0.8);
            transform: translateY(-50%) scale(1.1);
        }
        .dark .control_prev, .dark .control_next {
            background: rgba(255, 255, 255, 0.2);
        }
        .dark .control_prev:hover, .dark .control_next:hover {
            background: rgba(255, 255, 255, 0.4);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section with Image Slider -->
    <section class="relative bg-gray-50 dark:bg-gray-900">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            <div class="image-slider shadow-2xl">
                <div class="image-slider-controls">
                    <a href="#" class="control_prev">&#129144;</a>
                    <a href="#" class="control_next">&#129146;</a>
                </div>
                <ul class="m-0 p-0">
                    <li>
                        <img class="image-slider-img" src="./images/inverter.png" alt="Solar Inverter Solution">
                    </li>
                    <li>
                        <img class="image-slider-img" src="./images/water-big.jpeg" alt="Water Purification System">
                    </li>
                    <li>
                        <img class="image-slider-img" src="./images/security-big.jpeg" alt="Security Solutions">
                    </li>
                </ul>
                
                <!-- Hero Overlay Content -->
                <div class="absolute inset-0 bg-black bg-opacity-40 dark:bg-black dark:bg-opacity-60 flex items-center justify-center">
                    <div class="text-center text-white px-4">
                        <h1 class="text-4xl md:text-6xl font-bold mb-4 text-shadow">OFF THE GRID</h1>
                        <p class="text-lg md:text-xl mb-8 text-shadow max-w-2xl mx-auto">
                            South Africa's premier solar, water purification & security systems distributor
                        </p>
                        <div class="space-x-4">
                            <a href="#detailedSection" class="bg-orange-500 hover:bg-orange-600 text-white px-8 py-3 rounded-lg font-semibold transition-all duration-300 transform hover:scale-105">
                                Explore Solutions
                            </a>
                            <a href="#AboutUsSection" class="border-2 border-white text-white hover:bg-white hover:text-gray-900 px-8 py-3 rounded-lg font-semibold transition-all duration-300">
                                Learn More
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Solutions Section -->
    <section class="py-20 bg-white dark:bg-gray-900">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Section Header -->
            <div class="text-center mb-16">
                <h2 class="text-5xl font-bold text-gray-900 dark:text-white mb-4">
                    Our <span class="text-orange-500">Solutions</span>
                </h2>
                <div class="w-24 h-1 bg-orange-500 mx-auto rounded-full"></div>
            </div>

            <!-- Solutions Grid -->
            <div class="grid md:grid-cols-3 gap-8 lg:gap-12">
                <!-- Water Purification Card -->
                <div class="group relative overflow-hidden rounded-2xl shadow-xl hover:shadow-2xl dark:shadow-gray-900/30 transition-all duration-500 transform hover:-translate-y-2">
                    <div class="card-gradient p-8 h-full">
                        <div class="flex flex-col items-center text-center">
                            <div class="w-24 h-24 mb-6 rounded-full overflow-hidden shadow-lg">
                                <img class="w-full h-full object-cover" src="./images/water-small.jpeg" alt="Water Purification">
                            </div>
                            <h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Water Solutions</h3>
                            <p class="text-gray-600 dark:text-gray-300 mb-2">Best Solution for</p>
                            <strong class="text-orange-500 text-lg mb-6">Clean Water Systems</strong>
                            <div class="mt-auto">
                                <div class="w-16 h-1 bg-orange-500 mx-auto rounded-full group-hover:w-24 transition-all duration-300"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Solar Solutions Card -->
                <div class="group relative overflow-hidden rounded-2xl shadow-xl hover:shadow-2xl dark:shadow-gray-900/30 transition-all duration-500 transform hover:-translate-y-2">
                    <div class="card-gradient p-8 h-full">
                        <div class="flex flex-col items-center text-center">
                            <div class="w-24 h-24 mb-6 rounded-full overflow-hidden shadow-lg">
                                <img class="w-full h-full object-cover" src="./images/solar-small.jpeg" alt="Solar Solutions">
                            </div>
                            <h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Solar Solutions</h3>
                            <p class="text-gray-600 dark:text-gray-300 mb-2">Best Solution for</p>
                            <strong class="text-orange-500 text-lg mb-6">Renewable Energy</strong>
                            <div class="mt-auto">
                                <div class="w-16 h-1 bg-orange-500 mx-auto rounded-full group-hover:w-24 transition-all duration-300"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Security Solutions Card -->
                <div class="group relative overflow-hidden rounded-2xl shadow-xl hover:shadow-2xl dark:shadow-gray-900/30 transition-all duration-500 transform hover:-translate-y-2">
                    <div class="card-gradient p-8 h-full">
                        <div class="flex flex-col items-center text-center">
                            <div class="w-24 h-24 mb-6 rounded-full overflow-hidden shadow-lg">
                                <img class="w-full h-full object-cover" src="./images/security-small.jpeg" alt="Security Solutions">
                            </div>
                            <h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Security Solutions</h3>
                            <p class="text-gray-600 dark:text-gray-300 mb-2">Best Solution for</p>
                            <strong class="text-orange-500 text-lg mb-6">Security Products</strong>
                            <div class="mt-auto">
                                <div class="w-16 h-1 bg-orange-500 mx-auto rounded-full group-hover:w-24 transition-all duration-300"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Detailed Solutions Section -->
    <section id="detailedSection" class="py-20 hero-gradient">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid lg:grid-cols-3 gap-8">
                
                <!-- Solar Solutions -->
                <div class="bg-white dark:bg-gray-800 rounded-2xl p-8 shadow-xl hover:shadow-2xl dark:shadow-gray-900/30 transition-all duration-300">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-orange-500 rounded-lg flex items-center justify-center mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
                            </svg>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900 dark:text-white">Solar Solutions</h3>
                    </div>
                    
                    <p class="text-gray-600 dark:text-gray-300 leading-relaxed mb-8">
                        Experience hassle-free solar energy with OFF THE GRID. Our flexible plans offer top-notch solar systems with the commitment of ownership.
                    </p>
                    
                    <asp:Button ID="Btnsolar" runat="server" Text="Solar Solutions" 
                        CssClass="w-full bg-orange-500 hover:bg-orange-600 text-white px-6 py-3 rounded-xl font-bold transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl" OnClick="Btnsolar_Click" />
                </div>

                <!-- Water Purification -->
                <div class="bg-white dark:bg-gray-800 rounded-2xl p-8 shadow-xl hover:shadow-2xl dark:shadow-gray-900/30 transition-all duration-300">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-blue-500 rounded-lg flex items-center justify-center mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path>
                            </svg>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900 dark:text-white">Water Purification</h3>
                    </div>
                    
                    <p class="text-gray-600 dark:text-gray-300 leading-relaxed mb-8">
                        Experience hassle-free water purification with OFF THE GRID. Our flexible plans offer top-notch water purification systems with the commitment of ownership.
                    </p>
                    
                    <asp:Button ID="water" runat="server" Text="Water Purification" 
                        CssClass="w-full bg-blue-500 hover:bg-blue-600 text-white px-6 py-3 rounded-xl font-bold transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl" OnClick="water_Click" />
                </div>

                <!-- Security Systems -->
                <div class="bg-white dark:bg-gray-800 rounded-2xl p-8 shadow-xl hover:shadow-2xl dark:shadow-gray-900/30 transition-all duration-300">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-green-500 rounded-lg flex items-center justify-center mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                            </svg>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900 dark:text-white">Security Systems</h3>
                    </div>
                    
                    <p class="text-gray-600 dark:text-gray-300 leading-relaxed mb-8">
                        Protect your property with our advanced security solutions. From surveillance to smart monitoring, we've got you covered with professional-grade equipment.
                    </p>
                    
                    <asp:Button ID="Button1" runat="server" Text="Security Systems" 
                        CssClass="w-full bg-green-500 hover:bg-green-600 text-white px-6 py-3 rounded-xl font-bold transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-xl" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </section>

    <!-- About Us Section -->
    <section id="AboutUsSection" class="py-20 bg-gray-50 dark:bg-gray-900">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid lg:grid-cols-2 gap-12 items-center">
                
                <!-- Image Side -->
                <div class="relative">
                    <!-- Decorative Elements -->
                    <div class="absolute -top-4 -right-4 w-24 h-24 bg-orange-500 rounded-full opacity-20"></div>
                    <div class="absolute -bottom-4 -left-4 w-32 h-32 bg-blue-500 rounded-full opacity-20"></div>
                </div>

                <!-- Content Side -->
                <div class="lg:pl-8">
                    <div class="mb-6">
                        <span class="text-orange-500 font-semibold text-lg">Our Story</span>
                        <h3 class="text-4xl font-bold text-gray-900 dark:text-white mt-2 mb-6">About Us</h3>
                        <div class="w-20 h-1 bg-orange-500 rounded-full"></div>
                    </div>
                    
                    <p class="text-gray-600 dark:text-gray-300 leading-relaxed text-lg mb-8">
                        Welcome to OFF THE GRID, South Africa's premier solar, water purification & security systems distributor since 2025. With centers all over the country we offer cutting-edge renewable energy products and top-tier after-sales support. Our mission is to lead South Africa's transition to sustainable living by providing excellent products and empowering communities. Join us in shaping a greener, safer future.
                    </p>

                    <!-- Stats or Features -->
                    <div class="grid grid-cols-2 gap-6 mb-8">
                        <div class="text-center p-4 bg-white dark:bg-gray-800 rounded-lg shadow-md dark:shadow-gray-900/30">
                            <div class="text-3xl font-bold text-orange-500 mb-2">2025</div>
                            <div class="text-gray-600 dark:text-gray-400">Established</div>
                        </div>
                        <div class="text-center p-4 bg-white dark:bg-gray-800 rounded-lg shadow-md dark:shadow-gray-900/30">
                            <div class="text-3xl font-bold text-blue-500 mb-2">100%</div>
                            <div class="text-gray-600 dark:text-gray-400">Satisfaction</div>
                        </div>
                    </div>

                    <button class="bg-gray-900 dark:bg-orange-500 hover:bg-gray-800 dark:hover:bg-orange-600 text-white px-8 py-4 rounded-xl font-bold transition-all duration-300 transform hover:scale-105">
                        Learn More About Us
                    </button>
                </div>
            </div>
        </div>
    </section>

    <script>
        // Simple image slider functionality
        document.addEventListener('DOMContentLoaded', function () {
            const slider = document.querySelector('.image-slider ul');
            const slides = document.querySelectorAll('.image-slider li');
            const prevBtn = document.querySelector('.control_prev');
            const nextBtn = document.querySelector('.control_next');

            let currentSlide = 0;
            const totalSlides = slides.length;

            function goToSlide(n) {
                slider.style.transform = `translateX(-${n * 100}%)`;
                currentSlide = n;
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % totalSlides;
                goToSlide(currentSlide);
            }

            function prevSlide() {
                currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
                goToSlide(currentSlide);
            }

            nextBtn.addEventListener('click', function (e) {
                e.preventDefault();
                nextSlide();
            });

            prevBtn.addEventListener('click', function (e) {
                e.preventDefault();
                prevSlide();
            });

            // Auto-slide every 5 seconds
            setInterval(nextSlide, 5000);
        });
    </script>
</asp:Content>
