module Recipe
    def self.ie
        if Os.windows?
            'reg query "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Internet Explorer" /v Version'
        end
    end
end
