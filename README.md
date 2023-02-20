# ays-iOS
<h2>Project Architecture </h2> <p>MVVM + Router(Without Storyboard)</p>

<h2><p>Project Example Design Pattern</p></h2> 

Root
- App
    * AppDelegate.swift
    * SceneDelegate.swift
    * AppContainer.swift
    * AppRouter.swift
- Custom
    - All custom classes can be added in this document
- Extensions 
- Scenes
    - Splash Screen
         - ViewController
             * SplashScreenViewController.xib
             * SplashScreenViewController.swift
         * SplashScreenViewModel.swift
         * SplashScreenContracts.swift 
         * SplashScreenRouter.swift
     - ....
- Sources
   Assets etc.
