# To install the fixed jdk you have 2 options
 1. Install the JDK from launchpad

        # adding the repository
        sudo add-apt-repository ppa:no1wantdthisname/openjdk-fontfix
        sudo apt-get update
        
        # installing the jdk 7
        sudo apt-get install openjdk-7-jdk
        
        # or installing the jdk 8
        sudo apt-get install openjdk-8-jdk

 2. Install from launchpad without add-apt-repository
        # Add the next 2 lines to the /etc/apt/sources.lst
        deb http://ppa.launchpad.net/no1wantdthisname/openjdk-fontfix/ubuntu trusty main 
        deb-src http://ppa.launchpad.net/no1wantdthisname/openjdk-fontfix/ubuntu trusty main

        # installing the jdk 7
        sudo apt-get install openjdk-7-jdk
        
        # or installing the jdk 8
        sudo apt-get install openjdk-8-jdk

 3. Download the compiled JDK and set youself the jdk path (usefull for who already have a jdk installed (everyone probaly))
>  Download the compiled open-jdk-8 with font fix in
> http://googledrive.com/host/0BwBEh4QJvkXjQzIxSFJtal9LNXM after
> downloaded rename the file name to something like jdk8.tar.xz or
> download here
> https://drive.google.com/file/d/0BwBEh4QJvkXjQzIxSFJtal9LNXM

# To use it in netbeans for example
 - In $NETBEANS_HOME/etc/netbeans.conf change the value of variable netbeans_jdkhome
>   netbeans_jdkhome=$JAVA_HOME

- create in $NETBEANS_HOME/bin a fixed run script "nebeans_fixed.sh" for example with the follow code

        #!/bin/sh
        # >> setting the fixed jdk to the default only in this terminal
        export JAVA_HOME=/home/system/programs/java/jdk1.8.0-amd64-font-fixed
        
        # >> enabling the fix
        # "-Dawt.useSystemAAFontSettings=on" seems worse to me
        # "-Dsun.java2d.xrender=true" makes fonts darker
        export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd \
                              -Dsun.java2d.xrender=true"
        
        # running netbeans
        SCRIPT_FILE=$(readlink -f $0)
        SCRIPT_PATH=$(dirname $SCRIPT_FILE)
        $SCRIPT_PATH/netbeans;
    
    
  # To use it in intelij for example
    
        #!/bin/sh
        
        # change to your location
        IDEA_HOME=$HOME/.local/opt/idea
        
        export JAVA_HOME=/path-to-jdk-fixed
    
    # Note: Can modify $IDEA_HOME/bin/idea{,64}.vmoptions
    #       instead of setting here.
    # "-Dawt.useSystemAAFontSettings=on" seems worse to me
    # "-Dsun.java2d.xrender=true" makes fonts darker
    export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd \
                          -Dsun.java2d.xrender=true"
    
    # Having this set makes menu font size smaller (wtf?)
    export GNOME_DESKTOP_SESSION_ID=this-is-deprecated
    # unset GNOME_DESKTOP_SESSION_ID
    
    # run the wanted application (make sure that this application will be use the fixed jdk)
    exec $IDEA_HOME/bin/idea.sh "$@"


