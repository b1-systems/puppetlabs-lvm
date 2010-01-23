Puppet::Type.newtype(:logical_volume) do

    newparam(:name) do
        desc "The name of the logical volume.  This is the unqualified name and will be
            automatically added to the volume group's device path (e.g., '/dev/$vg/$lv')."

        validate do |value|
            if value.include?(File::SEPARATOR)
                raise ArgumentError, "Volume names must be entirely unqualified"
            end
        end
    end

    newparam(:volume_group) do
        desc "The volume group name associated with this logical volume.  This will automatically
            set this volume group as a dependency, but it must be defined elsewhere using the
            volume_group resource type."
    end

    newproperty(:size) do
        desc "The size of the logical volume. Set to undef to use all available space"
    end
    
    ensurable

end