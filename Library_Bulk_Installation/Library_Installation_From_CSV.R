#Script to install R packages using imported CSV

#Replace with location of exported CSV
import_location = "/home/junaidali_b/Windows/Package Lists/R/Installed Packages.csv"

#Importing CSV and extracting packages to be installed
packages_to_import = read.csv(import_location)
packages_to_import = packages_to_import[, 1]

#Updating all installed r packages
#When asked, respond 'yes' for using a personal library
update.packages(ask = F)

#Packages to be skipped
base_packages <- c("base", 
                   "datasets", 
                   "graphics", 
                   "grDevices", 
                   "grid", 
                   "methods", 
                   "parallel", 
                   "splines", 
                   "stats", 
                   "stats4", 
                   "tcltk", 
                   "tools", 
                   "utils")

#Loading installed packages
installed_packages = as.character(installed.packages()[, "Package"])

#Adding base packages to installed packages
installed_packages = c(installed_packages, base_packages)

#Iterating through package names from imported CSV
for (i in 1:length(packages_to_import))
{ 
  current_package = packages_to_import[i]
  
  #Installing package if it isn't already present
  if (current_package %in% installed_packages == F)
  {
    #Installing current package
    install.packages(current_package, ask = F)
    
    #Calling garbage collector for clearing memory
    gc()
    
  }
  
  #Output if package is already installed
  else 
  {
    print(paste(current_package, "is already installed"))
  }
  
}