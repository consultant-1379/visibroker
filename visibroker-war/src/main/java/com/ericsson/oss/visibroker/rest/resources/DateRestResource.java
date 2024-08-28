/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2012
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/

package com.ericsson.oss.visibroker.rest.resources;

import javax.enterprise.context.RequestScoped;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.ericsson.oss.itpf.sdk.resources.Resource;
import com.ericsson.oss.itpf.sdk.resources.Resources;

/*
 * Rest Services 
 *  
 * Resources are served relative to the servlet path specified in the {@link ApplicationPath}
 * annotation.
 * 
 */
@Path("/resource")
@RequestScoped
public class DateRestResource {
	private static final String ABSOLUTE_FILE_URI = "/ericsson/tor/data/nameservice/nameservice.ior";
 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/read")
	public String readFile() {
		Resource resource = Resources.getFileSystemResource(ABSOLUTE_FILE_URI);
		if (resource.exists()) {
			return resource.getAsText();
		} else {
			return "No Resource Found";
		}
	}

}