# maps
###R package for geographical maps

This version 3 of the maps package. The main change with respect to v2 is a new world map. The old map legacy map is included and switching to "legacy" mode is explained below.

##CHANGES:

- The 'world' data base has been replaced by a much more recent data base, imported from the Natural Earth data project (the 1:50m world map, version 3.1).
This may have several implications for code that calls map().
  * Country names have changed. This is inevitable, since e.g. post-1990 Europe is dramatically different. As a consequence, any call to map() that involves the argument "region=...", may be affected. For instance, map('world','USSR') is now obsolete, while map('world','Russia') works fine.
  * The new data base contains less small islands, but the choice may be a bit different.
  * Some remote islands that are officially part of other countries may cause an unexpected change in the scale of a map. This is not a new phenomenon (map('world','france') had this in the old set), but some new cases may occur now. As explained below, this will now occur *less often*. 
  * The naming of all polygons is as close as possible to the old world map. However, some inconsistencies have been remedied, e.g. on whether an island is called by its own name or as part of the country it belongs to. The choice is now mainly dependent on whether the entity has a seperate ISO code. The naming scheme unfortunately does not permit to represent all the intricacies. The data set ISOlist (see further) is added to provide more details.
  * Because of this segmentation by ISO code, some countries now have much less islands. For instance, map(region="France") now only shows metropolitan France. To add all overseas territories and departments, you can use region=ISOsov("France"),  which creates a list of all countries under French sovereignty. 
  * The new 'world' database has a higher resolution than before and looks much smoother. In fact, for some applications it may now suffice rather than needing to import worldHires.

- map.text(...,exact=TRUE) now behaves as documented. Previously, the "exact=TRUE" was not passed to the map drawing if add=FALSE. To get the old (non-documented) behaviour (plot map with exact=FALSE, write text for exact=TRUE) you should now use 2 commands: 
map(...,exact=F)
map.text(...,exact=T,add=T)

- map() now has default resolution=0 if fill==TRUE. This eliminates little errors in the polygons that resulted from thinning the boundaries in two different directions.

- A data frame ISOlist has been added which, for every country on the new world map, lists the official name, the ISO3166 2- and 3-letter codes, and also the "suvereignty".

- A set of simple functions allow to use this ISOlist table for creating a list of countries to map. So you can use the 2- or 3-letter code, but also create a list based on the sovereignty. In the future, I'll try to find a clean way to allow these ISO codes as map labels.



##FALL BACK TO LEGACY WORLD DATABASE
There are a few mechanisms to use the old 'world' database rather than the updated one, should that be necessary:
- Using 'database=legacy_world'
- Calling world.legacy(TRUE) for switching to the old database and world.legacy(FALSE) to switch back on the fly.
- Setting R_MAP_DATA_LEGACY=TRUE in the environment prior to loading maps

The last two options should only be used as a *temporary last resource*, to run code that requires the old database without having to edit it.

Please inform the maintainer of any problem that requires a fallback to the legacy database!


##TO DO/DISCUSS:

- Many islands remain nameless.
- The naming convention is largely maintained, but some choices are different. The changes mean that e.g. /region="France"/ now covers only metropolitan France, whithout (some of) the overseas departments and territories
- Some inconsistencies in the naming procedure remain. For instance, while most countries are named by their full name, "UK" and "USA" are shortened in the same way as in the old data base. For UK, this even required a hack in the mapping code to avoid adding Ukrain to the map.
- I'd like to find a way to get Antarctica show up a bit nicer, but whithout adding imaginary points that would be ruined in a projection or when changing the central meridian. 

