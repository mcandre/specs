module Recipe
    def self.as
        # Windows
        if Os.windows?
            'as -version'
            # Assume OS is a Unix variant.
            # as hangs by default, waiting for stdin to end;
            # Send EOF via /dev/null.
            #
            # Don't create spurious a.out file.
        else
            'as -o /dev/null -version < /dev/null'
        end
    end
end
