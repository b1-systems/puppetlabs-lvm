Puppet::Type.newtype(:volume_group) do
    @depthfirst = true

    newparam(:name) do
        desc "The name of the volume group."
    end

    newproperty(:physical_volumes, :array_matching => :all) do
        desc "The list of physical volumes to be included in the volume group; this
             will automatically set these as dependencies, but they must be defined elsewhere
             using the physical_volume resource type."
    end

    ensurable

    autorequire :physical_volume do
        self[:physical_volumes].collect do |pv|
            [:physical_volume, pv]
        end
    end

end