<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Dashboard Content -->
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div class="d-flex align-items-center">
                <i class="fas fa-home text-primary me-2"></i>
                <h4 class="mb-0 text-primary">Dashboard</h4>
            </div>
            <div class="d-flex">
                <div class="input-group" style="width: 300px;">
                    <input type="text" class="form-control" placeholder="Search videos...">
                    <button class="btn btn-outline-secondary" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Welcome Banner -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card bg-primary text-white">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="d-flex align-items-center mb-2">
                            <i class="fas fa-home me-2"></i>
                            <h5 class="mb-0">Welcome back, Administrator!</h5>
                        </div>
                        <p class="mb-0">Manage your videos, explore content, and connect with the community.</p>
                    </div>
                    <div class="col-md-4 text-end">
                        <div class="bg-white rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="fas fa-user text-primary" style="font-size: 2rem;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Quick Actions -->
<div class="row">
    <div class="col-12">
        <div class="d-flex align-items-center mb-3">
            <i class="fas fa-bolt text-warning me-2"></i>
            <h5 class="mb-0">Quick Actions</h5>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3 mb-3">
        <div class="card h-100 text-center">
            <div class="card-body">
                <i class="fas fa-upload text-primary" style="font-size: 2.5rem;"></i>
                <h6 class="card-title mt-2">Upload Video</h6>
                <p class="card-text small text-muted">Add new content</p>
            </div>
        </div>
    </div>
    <div class="col-md-3 mb-3">
        <div class="card h-100 text-center">
            <div class="card-body">
                <i class="fas fa-user-edit text-success" style="font-size: 2.5rem;"></i>
                <h6 class="card-title mt-2">Manage Users</h6>
                <p class="card-text small text-muted">User management</p>
            </div>
        </div>
    </div>
    <div class="col-md-3 mb-3">
        <div class="card h-100 text-center">
            <div class="card-body">
                <i class="fas fa-video text-info" style="font-size: 2.5rem;"></i>
                <h6 class="card-title mt-2">View Videos</h6>
                <p class="card-text small text-muted">Browse content</p>
            </div>
        </div>
    </div>
    <div class="col-md-3 mb-3">
        <div class="card h-100 text-center">
            <div class="card-body">
                <i class="fas fa-chart-pie text-warning" style="font-size: 2.5rem;"></i>
                <h6 class="card-title mt-2">Analytics</h6>
                <p class="card-text small text-muted">View statistics</p>
            </div>
        </div>
    </div>
</div>